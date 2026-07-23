
class Q08 {

    public static void main(String[] args) {

        Student s1 = new Student(101);
        Student s2 = new Student(101);

        System.out.println(s1 == s2);
        System.out.println(s1.equals(s2));
    }
}

class Student {

    int id;

    Student(int id) {
        this.id = id;
    }
}