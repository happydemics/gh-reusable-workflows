# gh-reusable-workflows

This repository contains GitHub action reusable workflows and composite actions.

Visibility is set to public because reusable workflows can't be private.

These workflows are for internal use only. You can't use them outside @Happydemics.

## Workflows

### Testing

You can use [this repository](https://github.com/happydemics/gh-reusable-workflows-tests)
to test the reusable workflows.

#### deployment-notification.yml

Used to notify applications deployments to slack.

A private lambda is called by this workflow.

#### outdated-dependencies-check-bundler.yml

Used to check if a ruby `Gemfile` / `Gemfile.lock` got outdated dependencies.

Send a slack notification with the `bundle outdated` output.

#### outdated-dependencies-check-yarn.yml

Used to check if a ruby `package.json` / `yarn.lock` got outdated dependencies.

Send a slack notification with the `yarn outdated` output.

## Composites

| Name | Description | |
|--|--|--|
| init-dependencies | Install / cache package.json dependencies using yarn | [Readme](./composite/init-dependencies/README.md) |
