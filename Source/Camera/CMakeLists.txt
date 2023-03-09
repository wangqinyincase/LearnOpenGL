# CMake 最低版本号要求
cmake_minimum_required (VERSION 2.9)

# 项目信息
project (Camera)

# 查找当前目录下的所有源文件
# 并将名称保存到 DIR_SRCS 变量
aux_source_directory(. DIR_SRCS)
aux_source_directory("${PROJECT_SOURCE_DIR}/../../ThirdLibrary/Depends/src/glad" DIR_SRCS_GLAD)

#message("DIR_SRCS_GLAD:${DIR_SRCS_GLAD}")
list(APPEND DIR_SRCS ${DIR_SRCS_GLAD})

include_directories ("${PROJECT_SOURCE_DIR}/../../ThirdLibrary/Depends/include")
link_directories("${PROJECT_SOURCE_DIR}/../../ThirdLibrary/Depends/libs/glfw/Debug")

# 指定生成目标
add_executable(Camera ${DIR_SRCS})

target_link_libraries(Camera opengl32 glfw3)
