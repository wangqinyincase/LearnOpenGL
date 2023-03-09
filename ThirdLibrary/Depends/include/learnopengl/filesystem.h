#ifndef FILESYSTEM_H
#define FILESYSTEM_H
#include <string>
#include <direct.h>

class FileSystem
{
public:
	static std::string getPath(const char* inPath)
	{
		return std::string("E:/Learn/OpenGL/LearnOpenGL/") + inPath;
	}

	static std::string getShaderPath(const char* inPath)
	{
		return std::string("E:/Learn/OpenGL/LearnOpenGL/resources/shaders/") + inPath;
	}

	static std::string getLocalShaderPath(const char* inPath)
	{
		char cwdpath[_MAX_PATH];
		_getcwd(cwdpath, _MAX_PATH);

		return std::string(cwdpath) + "../../" + inPath;
	}
};

#define SHADER_PATH(Shader) (FileSystem::getLocalShaderPath(Shader).c_str())
#endif
