#ifndef MALAMUTEPLUGIN_H
#define MALAMUTEPLUGIN_H

#include <QString>
#include <QQmlEngine>

#include "../Registries/DataTypeRegistry.h"
#include "../Registries/IdeaRegistry.h"

class MalamutePlugin : public QObject
{
public:
    virtual QString PluginName() = 0;

    virtual void registerIdeas(std::shared_ptr<IdeaRegistry> ideaRegistry) = 0;
    virtual void registerDataTypeAttributes(std::shared_ptr<DataTypeRegistry> dataTypeRegistry) = 0;
};

#endif // MALAMUTEPLUGIN_H
