mod foo;

use anyhow::Result;
use foo::function;

fn get_file() -> Result<String> {
    let string = std::fs::read_to_string("file.example")?;
    Ok(string)
}

fn main() -> Result<()> {
    println!("Hello, world! Rust {}", function());
    println!("Sum: {}", 3 + 3);

    let info = get_file();
    println!("This is an error: {:?}", info);
    Ok(())
}
