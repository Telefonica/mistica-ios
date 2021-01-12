#  StepperView

`StepperView.swift` displays the progress of a certain flow of steps.

## Usage

```swift
let stepper = StepperView()
stepper.numberOfSteps = 3
stepper.currentStep = 0
```

`StepperView.swift` can be configured as determined or indeterminate.
Determined steppers show the current step number. 
Indeterminate steppers just show a non numbered progress bar.

```swift
stepper.isDetermined = true
```

![custom](./docs/images/demo.png)
