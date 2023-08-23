# Changelog

All notable changes to this project will be documented in this file.

### [1.11.1](https://github.com/wandb/terraform-kubernetes-wandb/compare/v1.11.0...v1.11.1) (2023-08-23)


### Bug Fixes

* Add security context to pvc. ([#37](https://github.com/wandb/terraform-kubernetes-wandb/issues/37)) ([f1053b7](https://github.com/wandb/terraform-kubernetes-wandb/commit/f1053b70d0223e85b9252e8663aa42d84cfa7d81))

## [1.11.0](https://github.com/wandb/terraform-kubernetes-wandb/compare/v1.10.0...v1.11.0) (2023-08-22)


### Features

* **server:** Weave cache time and additional features. ([#35](https://github.com/wandb/terraform-kubernetes-wandb/issues/35)) ([5088d7b](https://github.com/wandb/terraform-kubernetes-wandb/commit/5088d7b248fbbe57ea7c4ea4f79ec60b1e797fb4)), closes [#36](https://github.com/wandb/terraform-kubernetes-wandb/issues/36)

## [1.10.0](https://github.com/wandb/terraform-kubernetes-wandb/compare/v1.9.0...v1.10.0) (2023-08-21)


### Features

* **storage:** Wire up optional PVC & storage class to weave ([#34](https://github.com/wandb/terraform-kubernetes-wandb/issues/34)) ([85bf61d](https://github.com/wandb/terraform-kubernetes-wandb/commit/85bf61d43ce7d0a962aae43503fefe73f5fd5d1f))

## [1.9.0](https://github.com/wandb/terraform-kubernetes-wandb/compare/v1.8.0...v1.9.0) (2023-08-16)


### Features

* **weave:** Add a new deployment and service for gorilla parquet ([#32](https://github.com/wandb/terraform-kubernetes-wandb/issues/32)) ([ed21c97](https://github.com/wandb/terraform-kubernetes-wandb/commit/ed21c9749c83ce3e84697cff53cfc73bcf5c0038))

## [1.8.0](https://github.com/wandb/terraform-kubernetes-wandb/compare/v1.7.0...v1.8.0) (2023-08-09)


### Features

* **weave:** Add a weave deployment under feature flag ([#29](https://github.com/wandb/terraform-kubernetes-wandb/issues/29)) ([256a2dc](https://github.com/wandb/terraform-kubernetes-wandb/commit/256a2dcac42672dcc56426bd64142cb33f825da1))
* **weave:** Add a weave deployment under feature flag ([#30](https://github.com/wandb/terraform-kubernetes-wandb/issues/30)) ([619f678](https://github.com/wandb/terraform-kubernetes-wandb/commit/619f678a9ad77336afa61583d2798286f4483ea4))
* **weave:** Add a weave deployment under feature flag ([#31](https://github.com/wandb/terraform-kubernetes-wandb/issues/31)) ([8c5b328](https://github.com/wandb/terraform-kubernetes-wandb/commit/8c5b328e9c254b649212095f49b7144d8ce905b4))

## [1.7.0](https://github.com/wandb/terraform-kubernetes-wandb/compare/v1.6.0...v1.7.0) (2023-05-03)


### Features

* Adds priority class for wandb pod ([#26](https://github.com/wandb/terraform-kubernetes-wandb/issues/26)) ([1481595](https://github.com/wandb/terraform-kubernetes-wandb/commit/1481595668f9d94030037c55c1a894f2ff401748))

## [1.6.0](https://github.com/wandb/terraform-kubernetes-wandb/compare/v1.5.0...v1.6.0) (2023-02-16)


### Features

* Make resources configurable ([#21](https://github.com/wandb/terraform-kubernetes-wandb/issues/21)) ([caca4e0](https://github.com/wandb/terraform-kubernetes-wandb/commit/caca4e0551431084c70b882fa5138aeba0ed4906))

## [1.5.0](https://github.com/wandb/terraform-kubernetes-wandb/compare/v1.4.1...v1.5.0) (2023-01-10)


### Features

* Create internal prometheus service ([#20](https://github.com/wandb/terraform-kubernetes-wandb/issues/20)) ([c080604](https://github.com/wandb/terraform-kubernetes-wandb/commit/c080604414d2dd18df79504f7239f83295c3d893))

### [1.4.1](https://github.com/wandb/terraform-kubernetes-wandb/compare/v1.4.0...v1.4.1) (2022-08-16)


### Bug Fixes

* Add oidc secret as K8s secret ([#19](https://github.com/wandb/terraform-kubernetes-wandb/issues/19)) ([906d242](https://github.com/wandb/terraform-kubernetes-wandb/commit/906d242320ce6595697a92a294e0fb3befe783b2))

## [1.4.0](https://github.com/wandb/terraform-kubernetes-wandb/compare/v1.3.0...v1.4.0) (2022-08-16)


### Features

* Add local restore variable ([#18](https://github.com/wandb/terraform-kubernetes-wandb/issues/18)) ([ebd69ab](https://github.com/wandb/terraform-kubernetes-wandb/commit/ebd69abe6d59ff7164359c5e7c5d7d2bf091ea12))

## [1.3.0](https://github.com/wandb/terraform-kubernetes-wandb/compare/v1.2.0...v1.3.0) (2022-08-16)


### Features

* Add client secret as configurable parameter ([#17](https://github.com/wandb/terraform-kubernetes-wandb/issues/17)) ([7167a69](https://github.com/wandb/terraform-kubernetes-wandb/commit/7167a69e4936e73ba7d1b76d3c30a1d796677944))

## [1.2.0](https://github.com/wandb/terraform-kubernetes-wandb/compare/v1.1.3...v1.2.0) (2022-08-12)


### Features

* Add support for additional non-predefined variables ([#16](https://github.com/wandb/terraform-kubernetes-wandb/issues/16)) ([50421e4](https://github.com/wandb/terraform-kubernetes-wandb/commit/50421e4aa6b71c71deb95e20caf59542c982b657))

### [1.1.3](https://github.com/wandb/terraform-kubernetes-wandb/compare/v1.1.2...v1.1.3) (2022-06-16)


### Bug Fixes

* Change connection string to use kubernetes secret ([#13](https://github.com/wandb/terraform-kubernetes-wandb/issues/13)) ([5093996](https://github.com/wandb/terraform-kubernetes-wandb/commit/5093996aa448942b9dfe14f2e3d98ef7451f62ea))

### [1.1.2](https://github.com/wandb/terraform-kubernetes-wandb/compare/v1.1.1...v1.1.2) (2022-05-10)


### Bug Fixes

* Remove count on config map ([#12](https://github.com/wandb/terraform-kubernetes-wandb/issues/12)) ([ed00777](https://github.com/wandb/terraform-kubernetes-wandb/commit/ed00777d27b0c6bfa3f8b5cd1cb23012ecfffe0d))

### [1.1.1](https://github.com/wandb/terraform-kubernetes-wandb/compare/v1.1.0...v1.1.1) (2022-05-05)


### Bug Fixes

* Update cert path ([#11](https://github.com/wandb/terraform-kubernetes-wandb/issues/11)) ([fcf8aef](https://github.com/wandb/terraform-kubernetes-wandb/commit/fcf8aef30f82527ced96470c2fd98cc6205eaeeb))

## [1.1.0](https://github.com/wandb/terraform-kubernetes-wandb/compare/v1.0.3...v1.1.0) (2022-05-04)


### Features

* Add option to mount redis cert ([#10](https://github.com/wandb/terraform-kubernetes-wandb/issues/10)) ([4f51ac4](https://github.com/wandb/terraform-kubernetes-wandb/commit/4f51ac43635a3094a7fe65c25a66336771e7a7f1))

### [1.0.3](https://github.com/wandb/terraform-kubernetes-wandb/compare/v1.0.2...v1.0.3) (2022-04-20)


### Bug Fixes

* Publish custom metrics ([#9](https://github.com/wandb/terraform-kubernetes-wandb/issues/9)) ([3dc2c83](https://github.com/wandb/terraform-kubernetes-wandb/commit/3dc2c83e30ea25838037e6a5a788c01323b1c57b))

### [1.0.2](https://github.com/wandb/terraform-kubernetes-wandb/compare/v1.0.1...v1.0.2) (2022-02-11)


### Bug Fixes

* Oidc auth method variable fix ([#7](https://github.com/wandb/terraform-kubernetes-wandb/issues/7)) ([44e3f2c](https://github.com/wandb/terraform-kubernetes-wandb/commit/44e3f2ce5132cd4cf937e731de49fc3cdf20c67f))

### [1.0.1](https://github.com/wandb/terraform-kubernetes-wandb/compare/v1.0.0...v1.0.1) (2022-02-11)


### Bug Fixes

* oidc varibles incorrect validation ([#5](https://github.com/wandb/terraform-kubernetes-wandb/issues/5)) ([d873cf9](https://github.com/wandb/terraform-kubernetes-wandb/commit/d873cf9a17ecb39ae4912eda4b5bc2e668262089))

## 1.0.0 (2022-02-11)


### Features

* Add OCID variable options ([#4](https://github.com/wandb/terraform-kubernetes-wandb/issues/4)) ([3a0237d](https://github.com/wandb/terraform-kubernetes-wandb/commit/3a0237d22de9fd5493765571d5bfe9e56921f5eb))
