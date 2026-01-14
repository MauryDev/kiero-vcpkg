vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

# Checa quais features foram ativadas e define variaveis (ENABLE_...)
vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    FEATURES
        d3d9      ENABLE_D3D9
        d3d10     ENABLE_D3D10
        d3d11     ENABLE_D3D11
        d3d12     ENABLE_D3D12
        opengl    ENABLE_OPENGL
        minhook   ENABLE_MINHOOK
)

vcpkg_cmake_configure(
    SOURCE_PATH "${CMAKE_CURRENT_LIST_DIR}"
    OPTIONS
        ${FEATURE_OPTIONS} # Passa as flags ativadas para o CMakeLists.txt
)

vcpkg_cmake_install()
vcpkg_copy_pdbs()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(WRITE "${CURRENT_PACKAGES_DIR}/share/${PORT}/copyright" "No license")