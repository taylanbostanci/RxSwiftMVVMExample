English:

Application designed to grasp the structure of MVVM with RxSwift.

I use in the project,

RxCocoa
RxRelay
RxSwift


# Model.swift
The class in which the Model structure used in the project is created.


# TaskViewController.swift
The inputs entered by the user are displayed in the tableview.
Filtering is done according to the priority of the string value saved by the user in the model.   // self.filterTasks(by: primary)


# AddingTaskViewController.swift 
The data is kept until the application is killed.



Turkish:

RxSwift ile MVVM yapısını kavramak için tasarlanmış bir uygulamadır.

Projede kullandığım Podlar,

RxCocoa
RxRelay
RxSwift


# Model.swift
Projede kullanılan Model yapısının oluşturulduğu sınıf.

# TaskViewController.swift
Kullanıcı tarafından Girilen inputların tableview'de gösterilmesinin sağlandığı sınıf.
Kullanıcının kaydettiği string değerin modeldeki önceliğine ( primary) göre filtereleme yapılıyor. // self.filterTasks(by: primary)


# AddingTaskViewController.swift 
Kullanıcı inputlarının kaydedilme fonksiyonunun gerçekleştirdiği sınıf.Veriler, uygulama kapatılıncaya kadar saklanır.
