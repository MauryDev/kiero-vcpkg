cmake_minimum_required(VERSION 3.10)
project(kiero)

add_library(kiero STATIC kiero.cpp kiero.h)

# --- Configuração do MinHook ---
option(ENABLE_MINHOOK "Enable MinHook" OFF)
if(ENABLE_MINHOOK)
    find_package(minhook CONFIG REQUIRED)
    target_link_libraries(kiero PRIVATE minhook::minhook)
    target_compile_definitions(kiero PRIVATE KIERO_USE_MINHOOK=1)
endif()

# --- Configuração D3D9 ---
option(ENABLE_D3D9 "Enable D3D9" OFF)
if(ENABLE_D3D9)
    target_compile_definitions(kiero PRIVATE KIERO_INCLUDE_D3D9=1)
    target_link_libraries(kiero PRIVATE d3d9)
endif()

# --- Configuração D3D10 ---
option(ENABLE_D3D10 "Enable D3D10" OFF)
if(ENABLE_D3D10)
    target_compile_definitions(kiero PRIVATE KIERO_INCLUDE_D3D10=1)
    target_link_libraries(kiero PRIVATE d3d10 dxgi)
endif()

# --- Configuração D3D11 ---
option(ENABLE_D3D11 "Enable D3D11" OFF)
if(ENABLE_D3D11)
    target_compile_definitions(kiero PRIVATE KIERO_INCLUDE_D3D11=1)
    target_link_libraries(kiero PRIVATE d3d11 dxgi)
endif()

# --- Configuração D3D12 ---
option(ENABLE_D3D12 "Enable D3D12" OFF)
if(ENABLE_D3D12)
    target_compile_definitions(kiero PRIVATE KIERO_INCLUDE_D3D12=1)
    target_link_libraries(kiero PRIVATE d3d12 dxgi)
endif()

# --- Configuração OpenGL ---
option(ENABLE_OPENGL "Enable OpenGL" OFF)
if(ENABLE_OPENGL)
    target_compile_definitions(kiero PRIVATE KIERO_INCLUDE_OPENGL=1)
    target_link_libraries(kiero PRIVATE opengl32)
endif()

install(TARGETS kiero DESTINATION lib)
install(FILES kiero.h DESTINATION include)