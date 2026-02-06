fn main() {
    use std::io::{self, Write};

fn main() {
    println!(" Weather forecast (demo version) ");
    
   
    println!("Enter the name of the city: ");
    
    
  
    let mut city = String::new();
    
  
    io::stdin()
        .read_line(&mut city)
        .expect("Error reading the input");
    
   
    let city = city.trim();
    
  
    if city.is_empty() {
        println!("You didn't enter the name of the city!");
        return;
    }
  
    println!("\n--- weather in city {} ---", city);
    
    
    let temp = (city.len() as i32 * 3) % 30 - 5;
    let conditions = match city.len() % 4 {
        0 => "☀️  Suny",
        1 => "☁️  Cloudly",
        2 => "🌧  Rain",
        _ => "⛅️ Cloud",
    };
    
    println!("Temperature: {}°C", temp);
    println!("Conditions: {}", conditions);
    println!("Humidity: {}%", 40 + (city.len() % 40));
}
}
