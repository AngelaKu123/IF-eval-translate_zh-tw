#!/bin/bash
# Copyright 2025 The Google Research Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

cd /root/translate

python3 -m instruction_following_eval.evaluation_main \
  --input_data=./instruction_following_eval/data/trans_manual.jsonl \
  --input_response_data=/root/translate/trans-prom_result/Mistral-Small-3.2-24B-Instruct-2506-CS-0625/t-model_response.jsonl \
  --output_dir=/root/translate/trans-func_result/Mistral-Small-3.2-24B-Instruct-2506-CS-0625/

exit 0