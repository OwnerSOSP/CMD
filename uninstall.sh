(echo "\n   ______________________________________\n  /                                      \ \n  ========================================\n  $(getprop ro.product.brand) ($(getprop ro.product.model)) tweaker\n  ========================================\n  hardware       : $(case $(getprop ro.hardware|tr [:upper:] [:lower:]) in mt*) echo mediatek;;apq*|msm*|qcom*|sd*|sm*) echo qualcomm;;exynos*|s5e*|universal*) echo samsung;;gs*|tensor*) echo google;;hi*|kirin*) echo hisilicon;;sc*|t*|ums*|unisoc*) echo unisoc;;*) echo unknown;;esac) ($(getprop ro.hardware))\n  software       : android ($(getprop ro.build.version.release))\n  ========================================\n  wait about 1 minutes until successful\n  ========================================\n  \                                      /\n   ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯\n")|tr '[:lower:]' '[:upper:]'
(for a in $(cmd package list packages|cut -f2 -d:)
do cmd appops reset "$a"&done
for b in $(cmd device_config list|cut -f1 -d=)
do cmd device_config delete "${b%/*}" "${b#*/}"&done
cmd package enable com.google.android.gms
cmd settings delete global activity_manager_constants
cmd settings delete global angle_gl_driver_all_angle
cmd settings delete global game_driver_all_apps
cmd settings delete global updatable_driver_all_apps
cmd notification post -S bigtext -t 'Success' tag 'Uninstalling CMD'
su -lp 2000 -c "cmd notification post -S bigtext -t 'Success' tag 'Uninstalling CMD'")>/dev/null 2>&1&
