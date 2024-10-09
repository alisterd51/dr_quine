use std::fs;
use std::process::Command;

const SULLY_1: &str = r#"
fn main() {
"#;
const SULLY_2: &str = r#"
    if i > 0 {
        let kid_name = format!("Sully_{}", i - 1);
        let kid_source = format!("{}.rs", kid_name);
        let kid_path = format!("./{}", kid_name);
        let data = format!(
            "use std::fs;\nuse std::process::Command;\n\nconst SULLY_1: &str = r$\"{}\"$;\nconst SULLY_2: &str = r$\"{}\"$;\n{}    let i = {};{}",
            SULLY_1,
            SULLY_2,
            SULLY_1.replace('\u{24}', "$"),
            i - 1,
            SULLY_2.replace('\u{24}', "$")
        );

        fs::write(kid_source.clone(), data).expect("Unable to write file");
        let command_status = Command::new("rustc")
            .arg(kid_source.clone())
            .arg("-o")
            .arg(kid_name.clone())
            .status()
            .expect("");
        if command_status.success() {
            Command::new(kid_path.clone()).spawn().expect("");
        }
    }
}
"#;

fn main() {
    let i = 5;
    if i > 0 {
        let kid_name = format!("Sully_{}", i - 1);
        let kid_source = format!("{}.rs", kid_name);
        let kid_path = format!("./{}", kid_name);
        let data = format!(
            "use std::fs;\nuse std::process::Command;\n\nconst SULLY_1: &str = r#\"{}\"#;\nconst SULLY_2: &str = r#\"{}\"#;\n{}    let i = {};{}",
            SULLY_1,
            SULLY_2,
            SULLY_1.replace('\u{24}', "#"),
            i - 1,
            SULLY_2.replace('\u{24}', "#")
        );

        fs::write(kid_source.clone(), data).expect("Unable to write file");
        let command_status = Command::new("rustc")
            .arg(kid_source.clone())
            .arg("-o")
            .arg(kid_name.clone())
            .status()
            .expect("");
        if command_status.success() {
            Command::new(kid_path.clone()).spawn().expect("");
        }
    }
}
