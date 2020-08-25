//
//  TeacherCourseView.swift
//  BluetoothiOS
//
//  Created by LiaoGuoYin on 2020/4/7.
//  Copyright © 2020 LiaoGuoYin. All rights reserved.
//

import SwiftUI

struct TeacherCourseView: View {
    @ObservedObject var viewModel: TeacherCourseViewModel
    @State private var isShowClassListAddSheet: Bool = false
    @State var selectedCourse = Set<Course>()
    
    var body: some View {
        NavigationView {
            List(selection: self.$selectedCourse) {
                Section(
                    header: HStack {
                        Text("课程列表")
                        Spacer()
                        addButton
                            .foregroundColor(.blue)
                    }
                ) {
                    ForEach(viewModel.courseList, id:\.id) { item in
                        NavigationLink(destination:
                                        CourseStudentView(viewModel: self.viewModel, students: item.students)
                        ) {
                            TeacherCourseRowView(course: item)
                        }
                    }
                    .onMove(perform: onMoveCourse)
                    .onDelete(perform: onDeleteCourse)
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle(Text("考勤管理"))
            .navigationBarItems(leading: EditButton(),trailing: sendSheetToBLEButton)
        }
        .sheet(isPresented: $isShowClassListAddSheet) {
            NewCourseFormView(viewModel: self.viewModel, form: Course(students: studentsDemo), studentList: studentsDemo)
        }
    }
}

extension TeacherCourseView {
    init() {
        self.init(viewModel: TeacherCourseViewModel())
        for _ in 1..<2 {
            viewModel.addCourse(Course(students: studentsDemo))
        }
    }
    
    func loadLocalData() {
        
    }
    
    func onMoveCourse(source: IndexSet, destination: Int) {
        viewModel.moveCourse(from: source, to: destination)
    }
    
    func onDeleteCourse(at indexSet: IndexSet) {
        viewModel.deleteCourse(indexSet)
    }
    
    var addButton: some View {
        Button(action: { self.isShowClassListAddSheet.toggle() }) {
            Image(systemName: "plus")
                .font(.headline)
//            TODO for expand the button's tap area
//                .padding(EdgeInsets(top: 50, leading: 50, bottom: 50, trailing: 0))
        }
    }
    
    var sendSheetToBLEButton: some View {
        Button(action: {
            selectedCourse.insert(Course(students: studentsDemo))
            print(selectedCourse)
            let selectedCourseString = serializeStudentsToStringForSending(selection: selectedCourse)
            self.viewModel.sendStudentStringToBLE(of: selectedCourseString)
        }, label: {
            Image(systemName: "staroflife")
        })
    }
}

struct TeacherCourseView_Previews: PreviewProvider {
    static var previews: some View {
        TeacherCourseView()
    }
}
