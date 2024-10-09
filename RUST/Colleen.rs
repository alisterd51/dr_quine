const COLLEEN: &str = r#"

// comment two

fn test() {
    print!("const COLLEEN: &str = r$\"{}\"$;{}", COLLEEN, COLLEEN.replace('\u{24}', "$"));
}

fn main() {
    // comment one
    test();
}
"#;

// comment two

fn test() {
    print!("const COLLEEN: &str = r#\"{}\"#;{}", COLLEEN, COLLEEN.replace('\u{24}', "#"));
}

fn main() {
    // comment one
    test();
}
