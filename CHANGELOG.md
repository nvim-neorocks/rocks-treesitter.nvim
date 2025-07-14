# Changelog

## [1.3.1](https://github.com/nvim-neorocks/rocks-treesitter.nvim/compare/v1.3.0...v1.3.1) (2025-07-14)


### Bug Fixes

* **rockspec:** restrict lua version to 5.1 ([f624d0d](https://github.com/nvim-neorocks/rocks-treesitter.nvim/commit/f624d0db18000e37bd9dda26839801075c50e920))

## [1.3.0](https://github.com/nvim-neorocks/rocks-treesitter.nvim/compare/v1.2.0...v1.3.0) (2024-12-21)


### Features

* add filetype .pacscript to parser map ([#44](https://github.com/nvim-neorocks/rocks-treesitter.nvim/issues/44)) ([a565e19](https://github.com/nvim-neorocks/rocks-treesitter.nvim/commit/a565e192c5e56c79e2d6c9f639b244061a007ce7))

## [1.2.0](https://github.com/nvim-neorocks/rocks-treesitter.nvim/compare/v1.1.3...v1.2.0) (2024-11-16)


### Features

* Add support for an optional import config path ([#41](https://github.com/nvim-neorocks/rocks-treesitter.nvim/issues/41)) ([deba3c2](https://github.com/nvim-neorocks/rocks-treesitter.nvim/commit/deba3c21d66bb641e78ba16fc6e7d6e177a1e3ff))

## [1.1.3](https://github.com/nvim-neorocks/rocks-treesitter.nvim/compare/v1.1.2...v1.1.3) (2024-09-19)


### Bug Fixes

* prefer released version over dev package when using auto_install ([#36](https://github.com/nvim-neorocks/rocks-treesitter.nvim/issues/36)) ([9cddec4](https://github.com/nvim-neorocks/rocks-treesitter.nvim/commit/9cddec4e82bb42eea948d8d76fef64c9e44ea193))

## [1.1.2](https://github.com/nvim-neorocks/rocks-treesitter.nvim/compare/v1.1.1...v1.1.2) (2024-08-31)


### Bug Fixes

* handle `vim.version.parse` returning `nil` ([#34](https://github.com/nvim-neorocks/rocks-treesitter.nvim/issues/34)) ([615dabe](https://github.com/nvim-neorocks/rocks-treesitter.nvim/commit/615dabe51559e4c35714d4f4405d9d848f8d0dc1))

## [1.1.1](https://github.com/nvim-neorocks/rocks-treesitter.nvim/compare/v1.1.0...v1.1.1) (2024-08-29)


### Bug Fixes

* error when disable config returns `false` ([63b711c](https://github.com/nvim-neorocks/rocks-treesitter.nvim/commit/63b711c6d0d10db80ff8550cfe840bd7d2200967)), closes [#31](https://github.com/nvim-neorocks/rocks-treesitter.nvim/issues/31)

## [1.1.0](https://github.com/nvim-neorocks/rocks-treesitter.nvim/compare/v1.0.3...v1.1.0) (2024-08-28)


### Features

* more fine-grained control for disabling highlighting ([#29](https://github.com/nvim-neorocks/rocks-treesitter.nvim/issues/29)) ([b0ee339](https://github.com/nvim-neorocks/rocks-treesitter.nvim/commit/b0ee339a6f61a47a7eacf16a7119d0761a340f9a))

## [1.0.3](https://github.com/nvim-neorocks/rocks-treesitter.nvim/compare/v1.0.2...v1.0.3) (2024-07-31)


### Bug Fixes

* **config:** handle when `auto_install` is `false` ([#24](https://github.com/nvim-neorocks/rocks-treesitter.nvim/issues/24)) ([3d19180](https://github.com/nvim-neorocks/rocks-treesitter.nvim/commit/3d19180ecfafa4abe1e121d36577406f6587b4bb))

## [1.0.2](https://github.com/nvim-neorocks/rocks-treesitter.nvim/compare/v1.0.1...v1.0.2) (2024-07-19)


### Bug Fixes

* install latest non-dev parser version if available ([c63b5bb](https://github.com/nvim-neorocks/rocks-treesitter.nvim/commit/c63b5bba9f37824d4f97340a6c7d8ca43c8e5b1a))

## [1.0.1](https://github.com/nvim-neorocks/rocks-treesitter.nvim/compare/v1.0.0...v1.0.1) (2024-07-19)


### Bug Fixes

* don't install `dev` parsers ([448652a](https://github.com/nvim-neorocks/rocks-treesitter.nvim/commit/448652aba68eb65e76d4125537b3756a57efa559))

## 1.0.0 (2024-07-18)


### ⚠ BREAKING CHANGES

* skeleton for rewrite + add WIP notice

### Features

* add filetype to parser map. Get rid of broken ci workflow ([33c988b](https://github.com/nvim-neorocks/rocks-treesitter.nvim/commit/33c988b169d28861e2832eae0cbbc06de1224d19))
* add gen-rockspec.lua ([73e3405](https://github.com/nvim-neorocks/rocks-treesitter.nvim/commit/73e3405c7dd47adf5f42e0f8508e3657f2647c89))
* add some filetype to parser mappings ([7117034](https://github.com/nvim-neorocks/rocks-treesitter.nvim/commit/71170346fb6bf315362d7e436d4e16222f7d3893))
* initial commit ([37e890b](https://github.com/nvim-neorocks/rocks-treesitter.nvim/commit/37e890b80c60854d0b77a12f070be5e1e7980d61))
* initial implementation of auto highlight + auto install ([5c145dc](https://github.com/nvim-neorocks/rocks-treesitter.nvim/commit/5c145dcc34522f0028f28198aa9b97be870b9618))
* remove nvim-treesitter version constraint ([029dde9](https://github.com/nvim-neorocks/rocks-treesitter.nvim/commit/029dde9d519019fd37f1e631ef0309961dcf24f7))
* skeleton for rewrite + add WIP notice ([ab5fe60](https://github.com/nvim-neorocks/rocks-treesitter.nvim/commit/ab5fe6095e2f89e70d1241e5a550206c8e6d0151))
* store previously declined installs ([1ad2803](https://github.com/nvim-neorocks/rocks-treesitter.nvim/commit/1ad2803cb1cbbd338b1eda22610cbaa87d14748c))


### Bug Fixes

* **auto_install:** fall back to luarocks.org query if cache is not populated ([c9ab744](https://github.com/nvim-neorocks/rocks-treesitter.nvim/commit/c9ab7443d6eed2501446be9de0b69fabcc759060))
* **macos:** parsers reinstalling when opening their filetype ([6c1324f](https://github.com/nvim-neorocks/rocks-treesitter.nvim/commit/6c1324fa3ada9967d7074f1bd1a2f590f6aa1478))
* return early if rock is found in cache ([7540153](https://github.com/nvim-neorocks/rocks-treesitter.nvim/commit/75401535ef742e861132dcd48ee40ca01a0ae348))
* stop using deprecated `Rocks packadd` ([09b24aa](https://github.com/nvim-neorocks/rocks-treesitter.nvim/commit/09b24aa8b240e67655a2faf796665a1787e92fbf))
* **ui:** proper usage of `vim.fn.confirm` ([#17](https://github.com/nvim-neorocks/rocks-treesitter.nvim/issues/17)) ([59903dc](https://github.com/nvim-neorocks/rocks-treesitter.nvim/commit/59903dca819ba78566b3fd21e976e4f1409a5743))
