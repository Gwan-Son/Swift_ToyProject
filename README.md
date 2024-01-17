# 음성메모 어플리케이션
SwiftUI로 구현한 간단한 음성메모 및 타이머 어플리케이션입니다.
<p align="center" width="100%">
  <img src="https://github.com/Gwan-Son/voiceMemo/assets/38202152/ab780213-cb30-42c4-89ba-e8b0f9f22bf8" width="40%" alt="Onboarding">
  <img src="https://github.com/Gwan-Son/voiceMemo/assets/38202152/308927d0-1714-4282-90ca-d1eb7e93e22c" width="40%" alt="Home">
</p>
<br />

# 개발 환경
- `XCode 15.2`
- `Swift 5.9.2`

# 파일 구조
```
.
├── voiceMemo
│   ├── App
│   │   ├── AppDelegate.swift
│   │   ├── LaunchScreen.storyboard
│   │   └── voiceMemoApp.swift
│   ├── Assets.xcassets
│   │   ├── AccentColor.colorset
│   │   │   └── Contents.json
│   │   ├── AppIcon.appiconset
│   │   │   ├── AppIcon.png
│   │   │   └── Contents.json
│   │   ├── Color
│   │   │   ├── Contents.json
│   │   │   ├── customBackgroundGreen.colorset
│   │   │   │   └── Contents.json
│   │   │   ├── customBlack.colorset
│   │   │   │   └── Contents.json
│   │   │   ├── customCoolGray.colorset
│   │   │   │   └── Contents.json
│   │   │   ├── customGray0.colorset
│   │   │   │   └── Contents.json
│   │   │   ├── customGray1.colorset
│   │   │   │   └── Contents.json
│   │   │   ├── customGray2.colorset
│   │   │   │   └── Contents.json
│   │   │   ├── customGreen.colorset
│   │   │   │   └── Contents.json
│   │   │   ├── customIconGray.colorset
│   │   │   │   └── Contents.json
│   │   │   ├── customOrange.colorset
│   │   │   │   └── Contents.json
│   │   │   ├── customSky.colorset
│   │   │   │   └── Contents.json
│   │   │   └── customWhite.colorset
│   │   │       └── Contents.json
│   │   ├── Common
│   │   │   ├── Contents.json
│   │   │   ├── background.imageset
│   │   │   │   ├── Contents.json
│   │   │   │   └── background.png
│   │   │   ├── close.imageset
│   │   │   │   ├── Contents.json
│   │   │   │   └── close.svg
│   │   │   ├── leftArrow.imageset
│   │   │   │   ├── Contents.json
│   │   │   │   └── leftArrow.svg
│   │   │   └── logo.imageset
│   │   │       ├── Contents.json
│   │   │       └── logo.png
│   │   ├── Contents.json
│   │   ├── MemoList
│   │   │   ├── Contents.json
│   │   │   ├── memoIcon.imageset
│   │   │   │   ├── Contents.json
│   │   │   │   └── memoIcon.svg
│   │   │   ├── memoIcon_selected.imageset
│   │   │   │   ├── Contents.json
│   │   │   │   └── memoIcon_selected.svg
│   │   │   └── trash.imageset
│   │   │       ├── Contents.json
│   │   │       └── trash.svg
│   │   ├── Onboarding
│   │   │   ├── Contents.json
│   │   │   ├── onboarding_1.imageset
│   │   │   │   ├── Contents.json
│   │   │   │   └── onboarding_1.pdf
│   │   │   ├── onboarding_2.imageset
│   │   │   │   ├── Contents.json
│   │   │   │   └── onboarding_2.pdf
│   │   │   ├── onboarding_3.imageset
│   │   │   │   ├── Contents.json
│   │   │   │   └── onboarding_3.pdf
│   │   │   ├── onboarding_4.imageset
│   │   │   │   ├── Contents.json
│   │   │   │   └── onboarding_4.pdf
│   │   │   └── startHome.imageset
│   │   │       ├── Contents.json
│   │   │       └── startHome.png
│   │   ├── Setting
│   │   │   ├── Contents.json
│   │   │   ├── arrowRight.imageset
│   │   │   │   ├── Contents.json
│   │   │   │   └── arrowRight.svg
│   │   │   ├── settingIcon.imageset
│   │   │   │   ├── Contents.json
│   │   │   │   └── settingIcon.svg
│   │   │   └── settingIcon_selected.imageset
│   │   │       ├── Contents.json
│   │   │       └── settingIcon_selected.svg
│   │   ├── Timer
│   │   │   ├── Contents.json
│   │   │   ├── timerIcon.imageset
│   │   │   │   ├── Contents.json
│   │   │   │   └── timerIcon.svg
│   │   │   └── timerIcon_selected.imageset
│   │   │       ├── Contents.json
│   │   │       └── timerIcon_selected.svg
│   │   ├── TodoList
│   │   │   ├── Contents.json
│   │   │   ├── pencil.imageset
│   │   │   │   ├── Contents.json
│   │   │   │   └── pencil.svg
│   │   │   ├── selectedBox.imageset
│   │   │   │   ├── Contents.json
│   │   │   │   └── selectedBox.svg
│   │   │   ├── todoIcon.imageset
│   │   │   │   ├── Contents.json
│   │   │   │   └── todoIcon.svg
│   │   │   ├── todoIcon_selected.imageset
│   │   │   │   ├── Contents.json
│   │   │   │   └── todoIcon_selected.svg
│   │   │   ├── unSelectedBox.imageset
│   │   │   │   ├── Contents.json
│   │   │   │   └── unSelectedBox.svg
│   │   │   └── writeBtn.imageset
│   │   │       ├── Contents.json
│   │   │       └── writeBtn.svg
│   │   └── VoiceRecorder
│   │       ├── Contents.json
│   │       ├── mic.imageset
│   │       │   ├── Contents.json
│   │       │   └── mic.pdf
│   │       ├── mic_recording.imageset
│   │       │   ├── Contents.json
│   │       │   └── mic_recording.png
│   │       ├── pause.imageset
│   │       │   ├── Contents.json
│   │       │   └── pause.svg
│   │       ├── play.imageset
│   │       │   ├── Contents.json
│   │       │   └── play.svg
│   │       ├── recordIcon.imageset
│   │       │   ├── Contents.json
│   │       │   └── recordIcon.png
│   │       └── recordIcon_selected.imageset
│   │           ├── Contents.json
│   │           └── recordIcon_selected.png
│   ├── Component
│   │   ├── CustomView
│   │   │   └── WriteBtn.swift
│   │   └── NavigationBar
│   │       ├── CustomNavigationBar.swift
│   │       └── NavigationBtnType.swift
│   ├── Core
│   │   ├── Extension
│   │   │   ├── Color+Extensions.swift
│   │   │   ├── Date+Extensions.swift
│   │   │   ├── Double+Extensions.swift
│   │   │   └── Int+Extensions.swift
│   │   └── Service
│   │       └── NotificationService.swift
│   ├── Feature
│   │   ├── Home
│   │   │   ├── HomeView.swift
│   │   │   ├── HomeViewModel.swift
│   │   │   ├── MemoList
│   │   │   │   ├── Memo
│   │   │   │   │   ├── MemoView.swift
│   │   │   │   │   └── MemoViewModel.swift
│   │   │   │   ├── MemoListView.swift
│   │   │   │   └── MemoListViewModel.swift
│   │   │   ├── Setting
│   │   │   │   └── SettingView.swift
│   │   │   ├── Timer
│   │   │   │   ├── TimerView.swift
│   │   │   │   └── TimerViewModel.swift
│   │   │   ├── TodoList
│   │   │   │   ├── Todo
│   │   │   │   │   ├── TodoView.swift
│   │   │   │   │   └── TodoViewModel.swift
│   │   │   │   ├── TodoListViewModel.swift
│   │   │   │   └── ToodoListView.swift
│   │   │   └── VoiceRecorder
│   │   │       ├── VoiceRecorderView.swift
│   │   │       └── VoiceRecorderViewModel.swift
│   │   └── Onboarding
│   │       ├── OnboardingView.swift
│   │       └── OnboardingViewModel.swift
│   ├── Model
│   │   ├── Home
│   │   │   └── Tab.swift
│   │   ├── Memo
│   │   │   └── Memo.swift
│   │   ├── Onboarding
│   │   │   └── OnboardingContent.swift
│   │   ├── Path
│   │   │   ├── Path.swift
│   │   │   └── PathType.swift
│   │   ├── Timer
│   │   │   └── Time.swift
│   │   └── Todo
│   │       └── Todo.swift
│   └── Preview Content
│       └── Preview Assets.xcassets
│           └── Contents.json
└── voiceMemo.xcodeproj
    ├── project.pbxproj
    ├── project.xcworkspace
    │   ├── contents.xcworkspacedata
    │   ├── xcshareddata
    │   │   ├── IDEWorkspaceChecks.plist
    │   │   └── swiftpm
    │   │       └── configuration
    │   └── xcuserdata
    │       ├── jyg.xcuserdatad
    │       │   └── UserInterfaceState.xcuserstate
    │       └── simgwanhyeok.xcuserdatad
    │           └── UserInterfaceState.xcuserstate
    └── xcuserdata
        ├── jyg.xcuserdatad
        │   ├── xcdebugger
        │   │   └── Breakpoints_v2.xcbkptlist
        │   └── xcschemes
        │       └── xcschememanagement.plist
        └── simgwanhyeok.xcuserdatad
            └── xcschemes
                └── xcschememanagement.plist

93 directories, 127 files

```
