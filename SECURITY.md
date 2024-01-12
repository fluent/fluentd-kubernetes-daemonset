# Security Policy

## Supported Versions

| Version   | Supported          |
|-----------|--------------------|
| 1.16.x    | :white_check_mark: |
| <= 1.15.x | :x:                |

## Reporting a Vulnerability

If you found the vulnerability about default configuration of **fluentd-daemonset-SOMETHING**, report from the following page:

* https://github.com/fluent/fluentd/security/advisories

> [!IMPORTANT]
> As fluentd-kubernetes-daemonset images are downstream of [fluent/fluentd](https://hub.docker.com/r/fluent/fluentd) container.
> Thus, even though security scanner reports pile of vulnerabilities, the updated container image can't be shipped
> until updated container image is deployed from upstream at first.

* If you found that bundled Ruby gems which are related to **fluentd-daemonset-SOMETHING** have vulnerabilities, please report to [fluentd-kubernetes-daemonset](https://github.com/fluent/fluentd-kubernetes-daemonset/issues/new).

* If you found that bundled Ruby gems which are related to **fluentd-docker-image** have vulnerabilities, please report to [fluentd-docker-image](https://github.com/fluent/fluentd-docker-image/issues/new).

* The vulnerability of non-Ruby gems should be fixed in upstream container image, so PLEASE check https://security-tracker.debian.org/tracker/ in advance.

> [!NOTE]
> In most cases, even though security scanner reports vulnerabilities, they are false-positive because fluentd doesn't use the vulnerable component.
