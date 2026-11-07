function settings_string_to_key(key_name)
{
    var key = string_trim(key_name);
    key = string_lower(key);
    key = string_replace_all(key, " ", "");
    key = string_replace_all(key, "_", "");
    switch (key) 
    {
        case "a": case "b": case "c": case "d": case "e": 
        case "f": case "g": case "h": case "i": case "j":
        case "k": case "l": case "m": case "n": case "o":
        case "p": case "q": case "r": case "s": case "t":
        case "u": case "v": case "w": case "x": case "y":
        case "z": 
        case "0": case "1": case "2": case "3": case "4": 
        case "5": case "6": case "7": case "8": case "9":
            return ord(string_upper(key));
            
        case "zero": return ord("0");
        case "one": return ord("1");
        case "two": return ord("2");
        case "three": return ord("3");
        case "four": return ord("4");
        case "five": return ord("5");
        case "six": return ord("6");
        case "seven": return ord("7");
        case "eight": return ord("8");
        case "nine": return ord("9");
            
        case "printscrn": case "prntscrn": case "printscreen": 
        case "sysrq": case "systemrequest": return vk_printscreen;
        case "pause": case "break": return vk_pause;
            
        case "pageup": return vk_pageup;
        case "pagedown": return vk_pagedown;
        case "insert": case "ins": return vk_insert;
        case "delete": case "del": return vk_delete;
        case "home": return vk_home;
        case "end": return vk_end;
            
        case "+": return vk_add;
        case "-": return vk_subtract;
        case "*": return vk_multiply;
        case "/": return vk_divide;
        case ".": return vk_decimal;
            
        case "f1": return vk_f1;
        case "f2": return vk_f2;
        case "f3": return vk_f3;
        case "f4": return vk_f4;
        case "f5": return vk_f5;
        case "f6": return vk_f6;
        case "f7": return vk_f7;
        case "f8": return vk_f8;
        case "f9": return vk_f9;
        case "f10": return vk_f10;
        case "f11": return vk_f11;
        case "f12": return vk_f12;
            
        case "tab": return vk_tab;
            
    	default: return vk_nokey;
    }
}