use std::fs;

const GRACE: &str = r#"

macro_rules! main {
    () => {
        pub fn main()
        {
            let data = format!("use std::fs;\n\nconst GRACE: &str = r$\"{}\"$;{}", GRACE, GRACE.replace('\u{24}', "$"));

            fs::write("Grace_kid.rs", data).expect("Unable to write file");
        }
    }
}

main!();
"#;

macro_rules! main {
    () => {
        pub fn main()
        {
            let data = format!("use std::fs;\n\nconst GRACE: &str = r#\"{}\"#;{}", GRACE, GRACE.replace('\u{24}', "#"));

            fs::write("Grace_kid.rs", data).expect("Unable to write file");
        }
    }
}

main!();
