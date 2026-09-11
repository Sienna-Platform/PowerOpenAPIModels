"""
    ElementType

Canonical element type of the stored array: a dtype spelling (f64, f32, i64, i32, u64, u32, u16, u8, i16, i8, bool) for scalars, else tuple(N,dtype) or a function-data kind. Says what one timestep's value means and how it is laid out.
"""
const ElementType = String
