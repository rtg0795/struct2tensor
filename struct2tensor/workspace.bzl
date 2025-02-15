# Copyright 2019 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# CPU kernels for struct2tensors.

"""struct2tensor external dependencies that can be loaded in WORKSPACE files."""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def struct2tensor_workspace():
    """All struct2tensor external dependencies."""

    # ===== Bazel package rules dependency =====
    http_archive(
        name = "rules_pkg",
        sha256 = "352c090cc3d3f9a6b4e676cf42a6047c16824959b438895a76c2989c6d7c246a",
        url = "https://github.com/bazelbuild/rules_pkg/releases/download/0.2.5/rules_pkg-0.2.5.tar.gz",
    )

    # LINT.IfChange(thrift_archive_version)
    http_archive(
        name = "thrift",
        build_file = "//third_party:thrift.BUILD",
        sha256 = "b7452d1873c6c43a580d2b4ae38cfaf8fa098ee6dc2925bae98dce0c010b1366",
        strip_prefix = "thrift-0.12.0",
        urls = [
            "https://github.com/apache/thrift/archive/0.12.0.tar.gz",
        ],
    )
    # LINT.ThenChange(third_party/thrift.BUILD:thrift_gen_version)

    # LINT.IfChange(arrow_archive_version)
    http_archive(
        name = "arrow",
        build_file = "//third_party:arrow.BUILD",
        sha256 = "d7b3838758a365c8c47d55ab0df1006a70db951c6964440ba354f81f518b8d8d",
        strip_prefix = "arrow-apache-arrow-0.16.0",
        urls = [
            "https://github.com/apache/arrow/archive/apache-arrow-0.16.0.tar.gz",
        ],
    )
    # LINT.ThenChange(third_party/arrow.BUILD:parquet_gen_version)

    _TFMD_COMMIT_HASH = "3fb0d94ed474cbc6269b594239a95b0367029e34"  # 1.9.0
    http_archive(
        name = "com_github_tensorflow_metadata",
        sha256 = "41fe892acd713851d617a69b82ff56557e5affe026e3c4804278bf7ddd144e51",
        strip_prefix = "metadata-%s" % _TFMD_COMMIT_HASH,
        urls = [
            "https://github.com/tensorflow/metadata/archive/%s.tar.gz" % _TFMD_COMMIT_HASH,
        ],
    )
