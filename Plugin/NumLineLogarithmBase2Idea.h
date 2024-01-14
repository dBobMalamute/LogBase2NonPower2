#ifndef NUMLINELOGARITHMBASE2IDEA_H
#define NUMLINELOGARITHMBASE2IDEA_H

#include "LogarithmBase2Idea.h"

struct NumLineLogarithmBase2Attributes : public IdeaAttributes
{
    NumLineLogarithmBase2Attributes();
};

class NumLineLogarithmBase2Idea : public LogarithmBase2Idea
{
    Q_OBJECT

    Q_PROPERTY(double upLimit READ upLimit WRITE setUpLimit NOTIFY upLimitChanged FINAL)

public:
    explicit NumLineLogarithmBase2Idea();
    const IdeaAttributes attributes() override;

    void resetDisplay() override;

    double upLimit() const;

signals:
    void upLimitChanged();

public slots:
    void setUpLimit(double newUpLimit);

private:
    double m_upLimit;
};

#endif // NUMLINELOGARITHMBASE2IDEA_H
