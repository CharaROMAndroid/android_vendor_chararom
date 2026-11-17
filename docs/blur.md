Background blur capability

Devices opt in with TARGET_CAN_USE_BLUR := true before inheriting
vendor/lineage/config/common_full_phone.mk (or another common product config).
Unset and false mean unsupported. TARGET_ENABLE_BLUR and TARGET_SUPPORTS_BLUR
are no longer opt-ins. Existing devices must explicitly migrate.

config/chararom.mk emits ro.surface_flinger.supports_background_blur=1 or 0.
Device trees must not also set that property in any partition. In particular,
the universal7885 override is removed; emulator product overrides must likewise
be removed when migrating those products.

CrossWindowBlurListeners.CROSS_WINDOW_BLUR_SUPPORTED is the shared runtime gate.
Settings Display, Accessibility, and the SystemUI blur QS tile already use it.
SystemUI window blur and the extra volume/power blur path use it, and media art
ignores saved blur/gray-blur filters on unsupported devices. CharaTweaks hides
media blur strength and removes those two filter choices without hiding the
other filters.

A20 deliberately does not opt in. Its local app-launch resource is false and
its default disable_window_blurs is 1. Those two resources are independent legacy
defaults, not capability checks. config_enableAppLaunchBlur currently has no
consumer in frameworks/base; do not treat it as proof that blur works.

Changing the capability requires rebuilding/rebooting; the public blur setting
only enables/disables effects on capable devices. This does not prohibit apps
from doing their own bitmap/RenderEffect blur.
