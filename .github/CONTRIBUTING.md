# 基础设施贡献指南

欢迎来到 Infrastructure 的世界！本文档会指导你如何为 StarUbiquitous Infrastructure 贡献一份自己的力量。
请在你要提 issue 或者 pull request 之前花几分钟来阅读一遍这篇指南。如果你发现文档中有错误或缺失的内容，欢迎提交 pull request。

## 分支管理

由于基础设施不存在发布周期，所以我们仅维护一个 `main` 分支，所有对 `main` 分支的改动都会马上发布到线上。
如果你要修复一个 bug，请发送 pull request 到 `main`，approve 之后会立刻合并；如果你要开发一个新功能或代码重构，请在 `feature` 或
`refactor` 分支上操作，我们会定时合并 `feature` 和 `refactor` 到 `main`。

## Bugs

我们使用 GitHub Issue 来做 bug 追踪，在你报告一个 bug 之前，请先确保已经搜索过已有的 issue。

## 新增功能

如果你有改进现有基础设施或新增基础设施的想法，欢迎提交 issue 需求。

## Pull Request

@StarUbiquitous/maintainers 团队会关注所有的 pull request，我们会 review 以及合并你的变更，也会要求你做一些修改或者告诉你为什么我们不接受这样的变更。

在你发送 Pull Request 之前，请确认你是按照下面的步骤来做的：

1. 基于 [正确的分支](#分支管理) 做修改
2. 在基础设施提供者目录下运行了 `terraform init`
3. 定义基础目录结构(可复制 `template` 目录)

## Providers lock

由于 CI 与贡献者的平台不同的缘故（如 CI 使用 Ubuntu latest，维护团队基于 Apple Silicon）在某些情况下会出现 `Error: Failed to install provider` 问题，

```terraform
Initializing the backend...

Successfully configured the backend "cos"! Terraform will automatically
use this backend unless the backend configuration changes.

Initializing provider plugins...
- terraform.io/builtin/terraform is built in to Terraform
- Reusing previous version of integrations/github from the dependency lock file
- Installing integrations/github v4.23.0...
╷
│ Error: Failed to install provider
│ 
│ Error while installing integrations/github v4.23.0: the current package for
│ registry.terraform.io/integrations/github 4.23.0 doesn't match any of the
│ checksums previously recorded in the dependency lock file
╵

Error: Terraform exited with code 1.
Error: Process completed with exit code 1.
```

可以参照下面的步骤解决：

1. 删除 `.terraform.lock.hcl .terraform`
2. 执行 `terraform providers lock -platform=darwin_amd64 -platform=linux_amd64 -platform=linux_arm64 -platform=darwin_arm64`
3. 执行 `terraform init`
