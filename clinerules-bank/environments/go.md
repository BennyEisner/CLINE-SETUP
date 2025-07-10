# Go Development Guidelines

## Package Architecture
- Use small, focused packages with single responsibilities
- Keep files under 500 lines when possible
- Use composition over embedding for complex types
- Create reusable functions and types across packages

## Error Handling Rules
- Always handle errors explicitly - never ignore them
- Use custom error types for domain-specific errors
- Wrap errors with context using `fmt.Errorf` or `errors.Wrap`
- Return errors as the last return value

## Package Structure Template

```go
// Package declaration and imports
package main

import (
    "context"
    "fmt"
    "log"
    "net/http"
    "time"
)

// Define types and interfaces before functions
type Config struct {
    Port     int           `json:"port"`
    Timeout  time.Duration `json:"timeout"`
    Database string        `json:"database"`
}

type Handler struct {
    config *Config
    db     Database
}

// Interface definitions
type Database interface {
    GetUser(ctx context.Context, id string) (*User, error)
    CreateUser(ctx context.Context, user *User) error
}

// Constructor function
func NewHandler(config *Config, db Database) *Handler {
    return &Handler{
        config: config,
        db:     db,
    }
}

// Method with proper error handling
func (h *Handler) HandleRequest(w http.ResponseWriter, r *http.Request) {
    ctx, cancel := context.WithTimeout(r.Context(), h.config.Timeout)
    defer cancel()

    // Extract request data
    userID := r.URL.Query().Get("id")
    if userID == "" {
        http.Error(w, "missing user ID", http.StatusBadRequest)
        return
    }

    // Business logic with error handling
    user, err := h.db.GetUser(ctx, userID)
    if err != nil {
        log.Printf("failed to get user %s: %v", userID, err)
        http.Error(w, "internal server error", http.StatusInternalServerError)
        return
    }

    // Success response
    w.Header().Set("Content-Type", "application/json")
    fmt.Fprintf(w, `{"user": "%s"}`, user.Name)
}

// Main function
func main() {
    config := &Config{
        Port:    8080,
        Timeout: 30 * time.Second,
    }

    // Initialize dependencies
    db := NewDatabase(config.Database)
    handler := NewHandler(config, db)

    // Setup routes
    http.HandleFunc("/user", handler.HandleRequest)

    // Start server
    log.Printf("Server starting on port %d", config.Port)
    if err := http.ListenAndServe(fmt.Sprintf(":%d", config.Port), nil); err != nil {
        log.Fatal("Server failed to start:", err)
    }
}