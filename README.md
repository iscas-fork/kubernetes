# 项目简介

本项目是在k3s-io基础上，进一步裁剪kubernetes。整个裁剪过程主要分为以下几个阶段；

- 保留[Kubernetes工作负载](https://kubernetes.io/docs/concepts/workloads/)1个版本；
- 只支持Pod、Job、CronJob、DamemonSet四种负载
- 裁剪[Kubernetes存储类型](https://kubernetes.io/docs/concepts/storage/)的支持
- Kubernetes存储不再支持amazon等公有存储
- 裁剪[Kubernetes网络管理](https://kubernetes.io/docs/concepts/cluster-administration/networking/)
- 重构Kubernetes的安全模块

# 本地测试
