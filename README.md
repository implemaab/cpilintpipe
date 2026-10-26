# CPILint pipe / GitHub Action

This pipe is using CPILint to lint SAP CPI development.
The CPILint version is based on the standard version but includes junit support.

## GitHub Actions

```yaml
- uses: actions/checkout@v4
- uses: implemaab/cpilintpipe@main
  with:
    rules: test.xml
    type: DIRECTORY
    directory: Packages
```

The inputs are the variables below in lower case (`rules`, `type`, `filename`, `directory`, `host`, `username`, `password`, `packages`, `debug`). Pass `password` from a secret, e.g. `${{ secrets.CPI_PASSWORD }}`. The action runs the published `ghcr.io/implemaab/cpilintpipe:latest` image.

The bundled CPILint is the [tester22/cpilint](https://github.com/tester22/cpilint) fork (branch `develop-test-output`), which adds `-format junit -output <file>`. To show the report on the run, add `mikepenz/action-junit-report` with `report_paths: "**/cpilint*.xml"` after the step (needs `checks: write`): one test case per iFlow, one failure per finding.

## Bitbucket Pipelines

Add the following snippet to the script section of your `bitbucket-pipelines.yml` file:

```yaml
script:
  - pipe: docker://ghcr.io/implemaab/cpilintpipe:latest
    variables:
      RULES : "test.xml"
      TYPE: "DIRECTORY"
      DIRECTORY: "Packages"
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
