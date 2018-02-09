# Build modules from source.

MODULE_DIR="${MODULE_DIR:-${DATADIR}/modules}"

if [ -d "${MODULE_DIR}" ]; then
    cd "${MODULE_DIR}" || exit 11

    # Find module sources.
    modules=$(find . -name "*.cpp")

    if [ -n "$modules" ]; then
        # Build modules.
        echo "Building modules $modules..."
        /opt/znc/bin/znc-buildmod $modules || exit 12
    fi

    cd /
fi
