class Q09 {

    public static void main(String[] args) {

        Student s1 = new Student(101);
        Student s2 = s1;

        s2.id = 200;

        System.out.println(s1.id);
        System.out.println(s1 == s2);
    }
}

class Student {
    int id;
    Student(int id) {
        this.id = id;
    }
}