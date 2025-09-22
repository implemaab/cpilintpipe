# Bitbucket Pipelines Pipe: CPILint

This pipe is using CPILint to lint SAP CPI development.
The CPILint version is based on the standard version but includes junit support.

## YAML Definition

Add the following snippet to the script section of your `bitbucket-pipelines.yml` file:

```yaml
script:
  - pipe: atlassian/demo-pipe-bash:0.1.0
    variables:
      NAME: "<string>"
      # DEBUG: "<boolean>" # Optional
```
## Variables

| Variable              | Usage                                                       |
| --------------------- | ----------------------------------------------------------- |
| RULES (*)             | CPILint Rule filename |
| TYPE                  | DIRECTORY or HOST depending on if the iflows are local |
| FILENAME              | Filename of junit report |
| DIRECTORY             | Folder containing IFlows (Only if Type is DIRECTORY) |
| HOST                  | CPI Hostname (Only if Type is HOST) |
| USERNAME              | CPI Username (Only if Type is HOST) |
| PASSWORD              | CPI Password (Only if Type is HOST) |
| PACKAGES              | CPI Packages to check (Only if Type is HOST) |
