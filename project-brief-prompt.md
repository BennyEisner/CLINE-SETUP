You are an AI assistant integrated into a development environment with access to all files and documentation in a given repository. Your task is to analyze the repository and create a comprehensive project brief. Here's the path to the repository you need to analyze:

<repository_path>
{{REPOSITORY_PATH}}
</repository_path>

Follow these steps to complete your task:

1. Analyze the repository thoroughly, examining the following elements:
   - README files
   - Documentation folders
   - Source code files
   - Configuration files (e.g., package.json, requirements.txt)
   - Build scripts
   - Deployment configurations
   - Test suites
   - Git history (if available)

2. In <repository_breakdown> tags:
   - List all files and directories found in the repository, categorizing them by type (e.g., source code, documentation, configuration files).
   - Summarize the contents of key files like README.md and package.json.
   - Note any patterns in file naming or directory structure.
   - Include relevant information about each element you've examined and note any important patterns or features you've observed.

3. Based on your analysis, create a comprehensive project brief that includes:
   - Project name and type
   - Description and primary goal
   - Target audience and use cases
   - Technical stack details
   - Key features
   - Project constraints
   - Success metrics

4. Use the following structure for your project brief:

```markdown
# Project Brief: [Project Name]

## Project Overview
- **Name**: [Project Name]
- **Type**: [Project Type]
- **Description**: [2-3 sentences describing the project]
- **Primary Goal**: [Main objective]

## Target Audience
- **Primary Users**: [Target users]
- **Use Cases**: [Main usage scenarios]
- **User Needs**: [Problems solved for users]

## Technical Stack
- **Frontend**: [Frontend technologies]
- **Backend**: [Backend technologies]
- **Database**: [Database technologies]
- **Deployment**: [Deployment platforms/methods]

## Key Features
1. [Feature 1 - brief description]
2. [Feature 2 - brief description]
3. [Feature 3 - brief description]
(Add more as needed)

## Project Constraints
- **Timeline**: [Key deadlines or milestones, if found]
- **Technical**: [Technical limitations or requirements]
- **Team**: [Team information, if available]

## Success Metrics
- [Metrics for measuring project success]
- [Key performance indicators]
- [User satisfaction goals]

## Current Project State
[Brief assessment of the project's current state, including any ongoing development or issues]

## Additional Notes
[Any other relevant information discovered during the analysis]
```

5. Important guidelines:
   - If certain information is not available or cannot be determined from the repository, indicate this in the relevant sections of the brief.
   - Be objective and factual in your assessment. Base all information in the brief on what you can directly observe in the repository.
   - If the repository contains multiple projects or components, focus on the main project or provide a brief overview of the entire ecosystem.
   - Ensure your project brief is thorough yet concise, providing a clear overview of the project's current state and objectives.
   - Do not make assumptions or add information that isn't supported by the files and documentation you've analyzed.

6. After creating the project brief, update the file located at memory-bank/projectBrief.md with the new content.

7. Confirm that you have completed the task by stating that you have updated the project brief file.

Begin your response with your breakdown of the repository.