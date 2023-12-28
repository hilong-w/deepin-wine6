#!/bin/bash -e 

function init_runtime() {
    curdir="/opt/deepinwine/runtime-i386"
    export LD_LIBRARY_PATH="${curdir}/usr/lib:${LD_LIBRARY_PATH}"
    export LD_LIBRARY_PATH="${curdir}/lib:${LD_LIBRARY_PATH}"

    export LD_LIBRARY_PATH="${curdir}/usr/lib/i386-linux-gnu:${LD_LIBRARY_PATH}"
    export LD_LIBRARY_PATH="${curdir}/lib/i386-linux-gnu:${LD_LIBRARY_PATH}"
    export LD_LIBRARY_PATH="${curdir}/usr/lib/X11:${LD_LIBRARY_PATH}"

    export PATH="${curdir}/bin:${curdir}/usr/bin:${PATH}"

    #Sound Library
    export LD_LIBRARY_PATH="${curdir}/usr/lib/i386-linux-gnu/pulseaudio:${LD_LIBRARY_PATH}"
    export LD_LIBRARY_PATH="${curdir}/usr/lib/i386-linux-gnu/alsa-lib:${LD_LIBRARY_PATH}"

    #wine LD
    export WINELDPATH="${curdir}/lib/ld-linux.so.2"
}

function init_32bit_config() {
    #export LADSPA_PATH="${curdir}/usr/lib/i386-linux-gnu/ladspa:${LADSPA_PATH}"
    #export AO_PLUGIN_PATH="${curdir}/usr/lib/ao/plugins-4:${AO_PLUGIN_PATH}"

    # For mpg123
    #export LD_LIBRARY_PATH="${curdir}/usr/lib/mpg123:${LD_LIBRARY_PATH}"

    # for libomxil-bellagio
    #export BELLAGIO_SEARCH_PATH="${curdir}/usr/lib/bellagio:${curdir}/usr/lib/omxloaders:${curdir}/usr/lib"

    # libGL drivers
    export LIBGL_DRIVERS_PATH="${curdir}/usr/lib/i386-linux-gnu/dri:${LIBGL_DRIVERS_PATH}"

    # Gallium Nine
    #export D3D_MODULE_PATH="${curdir}/usr/lib/d3d:${D3D_MODULE_PATH}"

    #Font Config
    export FONTCONFIG_PATH="${curdir}/etc/fonts:${FONTCONFIG_PATH}"

    # GTK 3.0
    export GTK_PATH="${curdir}/usr/lib/i386-linux-gnu/gtk-3.0"
    export GDK_PIXBUF_MODULE_FILE="${curdir}/usr/lib/i386-linux-gnu/gdk-pixbuf-2.0/2.10.0/loaders.cache"

    # GStreamer environment variables
    export GST_REGISTRY_REUSE_PLUGIN_SCANNER="no"
    export GST_PLUGIN_SYSTEM_PATH_1_0="${curdir}/usr/lib/i386-linux-gnu/gstreamer-1.0/"
    export GST_PLUGIN_SCANNER_1_0="${curdir}/usr/lib/i386-linux-gnu/gstreamer-1.0/gst-plugin-scanner"
    export GST_PTP_HELPER_1_0="${curdir}/usr/lib/i386-linux-gnu/gstreamer-1.0/gst-ptp-helper"
    export GST_PLUGIN_PATH="${GST_PLUGIN_SYSTEM_PATH_1_0}"
    export GST_PLUGIN_SYSTEM_PATH="${GST_PLUGIN_SYSTEM_PATH_1_0}"
    export GST_PLUGIN_SCANNER="${GST_PLUGIN_SCANNER_1_0}"

    # mesa-vulkan-driver
    export VK_ICD_FILENAMES="/opt/deepinwine/runtime-i386/usr/share/vulkan/icd.d/radeon_icd.i686.json:/opt/deepinwine/runtime-i386/usr/share/vulkan/icd.d/radeon_icd.i686.json"
}

function init_box86_runtime() {
    curdir="/opt/deepinwine/runtime-i386"
    export BOX86_LD_LIBRARY_PATH="${curdir}/usr/lib"
    export BOX86_LD_LIBRARY_PATH="${curdir}/lib:${BOX86_LD_LIBRARY_PATH}"

    export BOX86_LD_LIBRARY_PATH="${curdir}/usr/lib/i386-linux-gnu:${BOX86_LD_LIBRARY_PATH}"
    export BOX86_LD_LIBRARY_PATH="${curdir}/lib/i386-linux-gnu:${BOX86_LD_LIBRARY_PATH}"
    export BOX86_LD_LIBRARY_PATH="${curdir}/usr/lib/X11:${BOX86_LD_LIBRARY_PATH}"

    if [ "$XDG_SESSION_TYPE" == "wayland" ];then
        export BOX86_LD_PRELOAD="${curdir}/libx11hook.so"
        echo "$BOX86_LD_PRELOAD"
    fi
}
