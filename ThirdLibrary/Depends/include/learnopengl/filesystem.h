#ifndef FILESYSTEM_H
#define FILESYSTEM_H
#include <string>

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
};

#endif
