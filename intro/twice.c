extern int randMethod();

int twice(int a) {
    a = a * randMethod();
    return a;
}