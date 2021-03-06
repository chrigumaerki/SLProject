requires(qtHaveModule(opengl))

TEMPLATE = subdirs
SUBDIRS += lib-SLExternal
SUBDIRS += lib-SLExternal/assimp
SUBDIRS += lib-SLExternal/oculus
SUBDIRS += lib-SLProject
SUBDIRS += app-Demo-GLFW
SUBDIRS += app-Demo-Qt
SUBDIRS += app-Viewer-Qt
SUBDIRS +=
SUBDIRS += app-NodeManipulationDemo
SUBDIRS += ch09_TextureMapping

app-Demo-GLFW.depends = lib-SLProject
app-Demo-Qt.depends = lib-SLProject
app-Viewer-Qt.depends = lib-SLProject
app-LeapMotionTest.depends = lib-SLProject
app-NodeManipulationDemo.depends = lib-SLProject
lib-SLProject.depends = lib-SLExternal
lib-SLProject.depends = lib-SLExternal/assimp
lib-SLProject.depends = lib-SLExternal/oculus

CONFIG -= qml_debug

cache()

