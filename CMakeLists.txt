cmake_minimum_required(VERSION 3.14)

project(SimpleMedia LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

#find_package(QT NAMES Qt6 Qt5 REQUIRED COMPONENTS Core Qml Quick)
#find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS Core Qml Quick)

find_package(Qt6 REQUIRED COMPONENTS Core Gui OpenGL Qml Quick)

add_executable(SimpleMedia
  main.cpp
  AppleDialog.mm
  main.qrc
  main.qml
  PlayerMenu.qml
  Slider.qml
  Button.qml
)
target_link_libraries(SimpleMedia
    Qt${QT_VERSION_MAJOR}::Core
    Qt${QT_VERSION_MAJOR}::OpenGL
    Qt${QT_VERSION_MAJOR}::Qml
    Qt${QT_VERSION_MAJOR}::Quick)

#set_target_properties(SimpleMedia PROPERTIES LINK_FLAGS "-framework Foundation -framework Cocoa")
set_target_properties(SimpleMedia PROPERTIES
    WIN32_EXECUTABLE TRUE
    MACOSX_BUNDLE TRUE)

#install(TARGETS SimpleMedia
#    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})
install(TARGETS SimpleMedia
    RUNTIME DESTINATION "${CMAKE_INSTALL_LIBDIR}"
    BUNDLE DESTINATION "${CMAKE_INSTALL_LIBDIR}"
    LIBRARY DESTINATION "${CMAKE_INSTALL_LIBDIR}"
)
