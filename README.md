# Bitbucket Pipelines Pipe: My demo pipe

This pipe is an example to show how easy is to create pipes for Bitbucket Pipelines.

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
| NAME (*)              | The name that will be printed in the logs |
| DEBUG                 | Turn on extra debug information. Default: `false`. |

_(*) = required variable._

## Prerequisites

## Examples

Basic example:

```yaml
script:
  - pipe: atlassian/demo-pipe-bash:0.1.0
    variables:
      NAME: "foobar"
```

Advanced example:

```yaml
script:
  - pipe: atlassian/demo-pipe-bash:0.1.0
    variables:
      NAME: "foobar"
      DEBUG: "true"
```

## Support
If you’d like help with this pipe, or you have an issue or feature request, let us know.
The pipe is maintained by bitbucketci-team@atlassian.com.

If you’re reporting an issue, please include:

- the version of the pipe
- relevant logs and error messages
- steps to reproduce
