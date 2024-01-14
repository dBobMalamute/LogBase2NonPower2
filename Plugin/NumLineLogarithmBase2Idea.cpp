#include "NumLineLogarithmBase2Idea.h"
#include <cmath>

NumLineLogarithmBase2Attributes::NumLineLogarithmBase2Attributes()
{
    m_listName = "Number Line Logarithm Base 2";
    m_displayName = "Logarithm Base 2";
    m_iconPath = "qrc:/Icons/LogarithmBase2.png";

    m_dataTypesIn.push_back(Magic<NumberDataTypeAttributes>::cast().id());
    m_dataTypesOut.push_back(Magic<NumberDataTypeAttributes>::cast().id());

    m_embeddedQMLPath = ":/QML/NumLineLogarithmBase2Idea.qml";
    m_minimizedQMLPath = ":/QML/LogarithmBase2Minimized.qml";
    m_minimizedName = "";
    m_startMinimized = false;

    m_gear = true;
}

NumLineLogarithmBase2Idea::NumLineLogarithmBase2Idea() :
    m_upLimit(4.0)
{

}

const IdeaAttributes NumLineLogarithmBase2Idea::attributes()
{
    return Magic<NumLineLogarithmBase2Attributes>::cast();
}

void NumLineLogarithmBase2Idea::resetDisplay()
{
    qDebug() << "ResetDisplay called";
    if(valid())
    {
        double n = m_input.lock()->number();
        setUpLimit(std::ceil(n));

        double log = std::log2(n);
        emit display(n, log);
    }
}

double NumLineLogarithmBase2Idea::upLimit() const
{
    return m_upLimit;
}

void NumLineLogarithmBase2Idea::setUpLimit(double newUpLimit)
{
    if (qFuzzyCompare(m_upLimit, newUpLimit))
        return;
    if(newUpLimit >= 2.0)
        m_upLimit = newUpLimit;
    else
        m_upLimit = 2.0;
    emit upLimitChanged();
}
