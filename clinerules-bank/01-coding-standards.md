# Basic Coding Standards

## Code Quality Principles
- Write self-documenting code with clear, meaningful names
- Follow consistent indentation: 2 spaces for JS/TS/JSON, 4 spaces for Python
- Keep functions small and focused on a single responsibility

## Variable and Function Naming
- Use camelCase for variables and functions: `getUserData()`, `isUserLoggedIn`
- Use PascalCase for classes and components: `UserProfile`, `DataService`
- Use UPPER_CASE for constants: `MAX_RETRY_ATTEMPTS`, `API_BASE_URL`
- Use descriptive names: `calculateTotalPrice()` not `calc()`

## Error Handling Requirements
- Always handle errors gracefully with try-catch blocks
- Log errors with enough context to debug: include function name, input parameters
- Provide meaningful error messages to users

## Testing Standards
- Write unit tests for all business logic functions
- Aim for 80% code coverage minimum
- Use descriptive test names: `should_return_user_data_when_valid_id_provided`
- Mock external dependencies in tests

## Documentation Requirements
- Add JSDoc comments for all public functions
- Keep README.md updated with new features and setup instructions
- Document any complex algorithms or business logic inline
- Update API documentation when endpoints change

