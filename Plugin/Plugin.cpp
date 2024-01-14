#include "Plugin.h"

#include "NumberDataType.h"
#include "NumberDisplayIdea.h"
#include "TileLogarithmBase2Idea.h"
#include "NumberInputIdea.h"
#include "NumLineLogarithmBase2Idea.h"

QString Plugin::PluginName()
{
    return "Logarithm Base 2 Demo";
}

void Plugin::registerIdeas(std::shared_ptr<IdeaRegistry> ideaRegistry)
{
    ideaRegistry->registerIdea<NumberDisplayIdea>();
    ideaRegistry->registerIdea<TileLogarithmBase2Idea>();
    ideaRegistry->registerIdea<NumLineLogarithmBase2Idea>();
    ideaRegistry->registerIdea<NumberInputIdea>();

    qmlRegisterType(QUrl("qrc:/QML/NumLineLogVertLine.qml"), "com.malamute.calculator", 1, 0, "NumLineLogVertLine");
    qmlRegisterType(QUrl("qrc:/QML/QMLTemplates/OneToOneTemplate.qml"), "com.malamute.calculator", 1, 0, "OneToOneTemplate");
    qmlRegisterType(QUrl("qrc:/QML/QMLTemplates/LogarithmTemplate.qml"), "com.malamute.calculator", 1, 0, "LogarithmTemplate");
}

void Plugin::registerDataTypeAttributes(std::shared_ptr<DataTypeRegistry> dataTypeRegistry)
{
    dataTypeRegistry->registerDataTypeAttributes<NumberDataTypeAttributes>();
}
