#include "NumberDataType.h"

NumberDataTypeAttributes::NumberDataTypeAttributes()
{
    m_name = "Decimal Number";
    m_abbreviation = "#";

    m_defaultDisplay = "Number Display";
    m_defaultSource = "Number Input";
}

DataTypeAttributes NumberDataType::getAttributes()
{
    return Magic<NumberDataTypeAttributes>::cast();
}

NumberDataType::NumberDataType(const double number)
{
    m_number = number;
}

double NumberDataType::number()
{
    return m_number;
}



