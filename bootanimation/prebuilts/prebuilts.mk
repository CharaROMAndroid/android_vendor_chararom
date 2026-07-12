#
# Copyright (C) 2023 The risingOS Android Project
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
#

PRODUCT_SOONG_NAMESPACES += \
    vendor/lineage/prebuilts

PRODUCT_COPY_FILES += \
    vendor/lineage/bootanimation/prebuilts/bootanimation_evo_default.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation_evo_default.zip \
    vendor/lineage/bootanimation/prebuilts/bootanimation_evo_reveal.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation_evo_reveal.zip \
    vendor/lineage/bootanimation/prebuilts/bootanimation_meow.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation_meow.zip \
