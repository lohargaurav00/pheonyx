use flutter_rust_bridge::frb;

#[frb(mirror(Test))]
struct _TestInternal {
    one: u64,
    two: u64,
}

impl _TestInternal {
    pub fn new() -> Self {
        _TestInternal { one: 40, two: 40 }
    }

    pub fn add(self) -> u64 {
        self.one + self.two
    }
}
