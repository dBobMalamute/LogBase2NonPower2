#ifndef IDEAATTRIBUTES_H
#define IDEAATTRIBUTES_H

#include <QString>
#include <QStringList>
#include <QColor>
#include "DataType.h"
#include "Magic.h"

struct ExternalQMLLocation
{
    ExternalQMLLocation(bool offsetByWidth, bool offsetByHeight, int extraXOffset, int extraYOffset) :
        m_offsetByWidth(offsetByWidth),
        m_offsetByHeight(offsetByHeight),
        m_extraXOffset(extraXOffset),
        m_extraYOffset(extraYOffset)
    {

    }

public:
    bool offsetByWidth() const;
    bool offsetByHeight() const;
    int extraXOffset() const;
    int extraYOffset() const;

private:
    bool m_offsetByWidth;
    bool m_offsetByHeight;
    int m_extraXOffset;
    int m_extraYOffset;
};

class IdeaAttributes
{
public:

    QString listName() const;
    QString displayName() const;
    QString iconPath() const;

    std::vector<int> dataTypesIn() const;
    QStringList labelsIn() const;

    std::vector<int> dataTypesOut() const;
    QStringList labelsOut() const;

    bool customLabels() const;
    bool hasGear() const;
    bool resizeable() const;

    QString embeddedQMLPath() const;
    bool minimizable() const;
    bool differentNameOnMinimized() const;
    QString minimizedName() const;

    bool startMinimized() const;
    QString minimizedQMLPath() const;

    QStringList externalQMLPaths() const;
    std::vector<ExternalQMLLocation> externalQMLLocations() const;

protected:
    /// This name will appear in the ideas menu, other places.
    QString m_listName;
    /// This name will appear on the frame. Use "" to represent no visible name.
    QString m_displayName;
    /// The path to the icon. Use the qrc resource system.
    QString m_iconPath = "";

    /// The data types of those plugs. Use magic<DataTypeAttributes>::get().type();
    std::vector<int> m_dataTypesIn;
    /// The labels on the plugs. Only used if m_customLabels = true.
    QStringList m_labelsIn;

    /// The data types of those plugs. Use magic<DataTypeAttributes>::cast().type();
    std::vector<int> m_dataTypesOut;
    /// The labels on the plugs. Only used if m_customLabels = true.
    QStringList m_labelsOut;

    /// Use custom labels. If this is false, the program uses the abbreviations.
    bool m_customLabels = false;

    /// Does the box have a gear. By default this is false.
    bool m_gear = false;
    /// Does the box need a resizer. By default this is false.
    bool m_resizeable = false;

    /// The path to a qml file. Will be added to the center of the frame.
    QString m_embeddedQMLPath = "";

    /// This name will appear on the frame when minimized. Use "" to represent no visible name.
    QString m_minimizedName;

    /// Upon creation, will the idea be minimized or not?
    bool m_startMinimized = true;

    /// Allows a shorter QML file to appear when a file is minimized.
    QString m_minimizedQMLPath = "";

    /// Where the right click help post-it appears.
    /// There usually is no need to change this. It can be changed if that's useful.
    ExternalQMLLocation m_postitLocation = {false, true, -30,6};

    /// The path(s) to qml file. For extra controls etc.
    QStringList m_externalQMLPaths;
    /// Where the exteranl QML Files will appear. Relative to the casing.
    std::vector<ExternalQMLLocation> m_externalQMLLocations;
};

#endif // IDEAATTRIBUTES_H
