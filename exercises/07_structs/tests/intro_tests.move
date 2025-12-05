#[test_only]
module intro::intro_tests {
    use intro::intro;

    #[test]
    fun test_create_point() {
        let p = intro::create_point(10, 20);
        assert!(intro::get_x(&p) == 10, 1);
        assert!(intro::get_y(&p) == 20, 2);
    }

    #[test]
    fun test_get_x() {
        let p = intro::create_point(5, 15);
        let x = intro::get_x(&p);
        assert!(x == 5, 3);
    }

    #[test]
    fun test_get_y() {
        let p = intro::create_point(5, 15);
        let y = intro::get_y(&p);
        assert!(y == 15, 4);
    }

    #[test]
    fun test_set_x() {
        let mut p = intro::create_point(10, 20);
        intro::set_x(&mut p, 30);
        assert!(intro::get_x(&p) == 30, 5);
        assert!(intro::get_y(&p) == 20, 6);
    }

    #[test]
    fun test_create_coin() {
        let coin = intro::create_coin(100);
        assert!(intro::get_value(&coin) == 100, 7);
    }

    #[test]
    fun test_get_value() {
        let coin = intro::create_coin(50);
        let value = intro::get_value(&coin);
        assert!(value == 50, 8);
    }

    #[test]
    fun test_duplicate_coin() {
        let coin1 = intro::create_coin(100);
        let coin2 = intro::duplicate_coin(&coin1);
        assert!(intro::get_value(&coin1) == 100, 9);
        assert!(intro::get_value(&coin2) == 100, 10);
    }

    #[test]
    fun test_destructure_point() {
        let p = intro::create_point(10, 20);
        let (x, y) = intro::destructure_point(p);
        assert!(x == 10, 11);
        assert!(y == 20, 12);
    }

    #[test]
    fun test_extract_x() {
        let p = intro::create_point(15, 25);
        let x = intro::extract_x(p);
        assert!(x == 15, 13);
    }

    #[test]
    fun test_create_rectangle() {
        let rect = intro::create_rectangle(0, 0, 10, 10);
        assert!(intro::get_width(&rect) == 10, 14);
    }

    #[test]
    fun test_get_width() {
        let rect = intro::create_rectangle(5, 5, 20, 15);
        let width = intro::get_width(&rect);
        assert!(width == 15, 15); // 20 - 5 = 15
    }

    #[test]
    fun test_swap_coordinates() {
        let p1 = intro::create_point(10, 20);
        let p2 = intro::swap_coordinates(p1);
        assert!(intro::get_x(&p2) == 20, 16);
        assert!(intro::get_y(&p2) == 10, 17);
    }

    #[test]
    fun test_move_point() {
        let p1 = intro::create_point(10, 20);
        let p2 = intro::move_point(p1, 5, 10);
        assert!(intro::get_x(&p2) == 15, 18); // 10 + 5
        assert!(intro::get_y(&p2) == 30, 19); // 20 + 10
    }

    #[test]
    fun test_create_points_vector() {
        let points = intro::create_points_vector();
        assert!(vector::length(&points) == 3, 20);
        assert!(intro::get_x(vector::borrow(&points, 0)) == 1, 21);
        assert!(intro::get_y(vector::borrow(&points, 0)) == 2, 22);
    }

    #[test]
    fun test_sum_x_coordinates() {
        let points = intro::create_points_vector();
        let sum = intro::sum_x_coordinates(&points);
        assert!(sum == 9, 23); // 1 + 3 + 5 = 9
    }

    #[test]
    fun test_create_counter() {
        let counter = intro::create_counter(0);
        assert!(intro::get_count(&counter) == 0, 24);
    }

    #[test]
    fun test_increment_counter() {
        let mut counter = intro::create_counter(5);
        intro::increment_counter(&mut counter);
        assert!(intro::get_count(&counter) == 6, 25);
    }

    #[test]
    fun test_get_count() {
        let counter = intro::create_counter(42);
        let count = intro::get_count(&counter);
        assert!(count == 42, 26);
    }

    #[test]
    fun test_destroy_counter() {
        let mut counter = intro::create_counter(10);
        intro::increment_counter(&mut counter);
        let final_count = intro::destroy_counter(counter);
        assert!(final_count == 11, 27);
    }
}
