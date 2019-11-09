#pragma once

#include "pebble_defines.h"

typedef struct GColourPair
{
    GColor foreground;
    GColor background;
} GColourPair;

typedef struct ContentIndicatorConfig
{
    struct Layer *layer;
    bool times_out;
    GAlign alignment;
    GColourPair colors;
} ContentIndicatorConfig;

typedef struct ContentIndicator ContentIndicator;

typedef enum ContentIndicatorDirection
{
    ContentIndicatorDirectionUp,
    ContentIndicatorDirectionDown,
    NumContentIndicatorDirections
} ContentIndicatorDirection;
