# Media Query Implementation Guide

## Overview
This document outlines the responsive design implementation across the entire educational app using media queries and responsive utilities.

## What Has Been Implemented

### 1. Responsive Utility Class (`lib/utils/responsive.dart`)
Created a comprehensive responsive utility class with the following features:

#### Screen Size Detection
- **Mobile**: width < 600px
- **Tablet**: 600px ≤ width < 1024px
- **Desktop**: width ≥ 1024px

#### Key Features
- **Responsive Sizing**
  - `wp(percentage)`: Width percentage
  - `hp(percentage)`: Height percentage
  - `sp(size)`: Responsive font size (auto-scales for tablet/desktop)
  - `iconSize(baseSize)`: Responsive icon sizing
  - `gap(size)`: Responsive spacing

- **Responsive Layouts**
  - `padding()`: Auto-scaling padding
  - `margin()`: Auto-scaling margins
  - `borderRadius()`: Responsive border radius
  - `gridColumns()`: Dynamic grid columns based on screen size

- **Responsive Helpers**
  - `value<T>()`: Return different values for mobile/tablet/desktop
  - `maxContentWidth`: Maximum content width for centering on large screens
  - `elevation()`: Responsive shadow elevation

#### Context Extensions
```dart
context.responsive  // Access Responsive instance
context.isMobile    // Quick boolean checks
context.isTablet
context.isDesktop
context.isLandscape
context.isPortrait
```

#### Responsive Widgets
- `ResponsiveBuilder`: Build widgets with responsive context
- `ResponsiveLayout`: Different layouts for different screen sizes

### 2. Screens Updated with Responsive Design

#### Home Screen (`lib/screens/home_screen.dart`)
✅ **Fully Responsive**
- Header with responsive avatar size (65px → 80px → 95px)
- Responsive font sizes throughout
- Responsive padding and margins
- Responsive icon sizes
- Responsive bottom navigation bar
- Responsive level card with adaptive trophy icon
- Responsive category navigation items
- Responsive section cards

#### Selection Screens (`lib/screens/selection_screens.dart`)
✅ **Fully Responsive**

**Standard Selection Screen**
- Responsive header icon
- Responsive font sizes for titles and descriptions
- Responsive padding and spacing
- Responsive standard buttons with adaptive icons

**Avatar Selection Screen**
- Dynamic grid columns (2 → 3 → 4 columns)
- Responsive avatar cards
- Responsive icon sizes
- Responsive spacing and padding
- Responsive button sizing

**Subject Selection Screen**
- Responsive grid layout
- Responsive subject cards
- Responsive font sizes and icons

## Responsive Breakpoints

### Mobile (< 600px)
- Base sizing (1x multiplier)
- 2 columns for grids
- Compact spacing

### Tablet (600px - 1024px)
- 1.2-1.3x multiplier for most elements
- 3 columns for grids
- Medium spacing

### Desktop (≥ 1024px)
- 1.4-1.6x multiplier for most elements
- 4 columns for grids
- Generous spacing

## How to Use in Other Screens

### Basic Usage
```dart
import '../utils/responsive.dart';

class MyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    
    return Container(
      padding: responsive.padding(all: 20),
      child: Text(
        'Hello',
        style: TextStyle(fontSize: responsive.sp(16)),
      ),
    );
  }
}
```

### Using Context Extensions
```dart
Widget build(BuildContext context) {
  return Container(
    width: context.isMobile ? 100 : 200,
    child: Text('Responsive Text'),
  );
}
```

### Using ResponsiveBuilder
```dart
ResponsiveBuilder(
  builder: (context, responsive) {
    return Container(
      padding: responsive.padding(all: 20),
      child: Text(
        'Hello',
        style: TextStyle(fontSize: responsive.sp(16)),
      ),
    );
  },
)
```

### Using ResponsiveLayout
```dart
ResponsiveLayout(
  mobile: MobileLayout(),
  tablet: TabletLayout(),
  desktop: DesktopLayout(),
)
```

## Remaining Screens to Update

The following screens still need responsive design implementation:

### Game Screens (`lib/screens/game_screens.dart`)
- CompareGameScreen
- DragDropGameScreen
- FillBlanksGameScreen
- MatchGameScreen
- LessonGameScreen

### Level Map Screen (`lib/screens/level_map_screen.dart`)
- Level nodes sizing
- Path visualization
- Responsive spacing between levels

### Auth Screen (`lib/screens/auth_screen.dart`)
- ProfilePage
- EditProfilePage
- AuthPage (login/signup)

## Best Practices

1. **Always use responsive utilities** instead of hardcoded values
2. **Test on multiple screen sizes** (mobile, tablet, desktop)
3. **Use context extensions** for quick boolean checks
4. **Leverage value<T>()** for different values per screen size
5. **Consider orientation** (landscape vs portrait)
6. **Use gridColumns()** for dynamic grid layouts
7. **Apply responsive elevation** for consistent shadows

## Testing Checklist

- [ ] Mobile portrait (< 600px)
- [ ] Mobile landscape
- [ ] Tablet portrait (600-1024px)
- [ ] Tablet landscape
- [ ] Desktop (> 1024px)
- [ ] Ultra-wide screens (> 1920px)

## Performance Considerations

- Responsive calculations are lightweight
- MediaQuery is cached by Flutter
- No performance impact on rebuilds
- Multipliers are pre-calculated

## Future Enhancements

1. Add support for custom breakpoints
2. Add responsive image loading
3. Add responsive video player sizing
4. Add responsive chart/graph sizing
5. Add accessibility scaling support
