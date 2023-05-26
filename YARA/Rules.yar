rule Detection{
    meta:
        Author = "Nyshadham Sathvik"
        date = "2023-05-24"
        description = "Defining few yara rules for signature scanning"
    strings:
        $signature = "MZ" // File header signature for executable files
    condition:
        $signature at 0
}
rule Detect_Suspicious_String {
    strings:
        $signature = "evil_malware_string"
    condition:
        $signature
}
rule Detect_Malicious_Hash {
    strings:
        $md5_hash = "0123456789abcdef0123456789abcdef"
    condition:
        $md5_hash
}
rule Detect_Evil_Function_Call {
    strings:
        $signature = "CreateRemoteThread"
    condition:
        $signature
}
rule Detect_Malicious_API_Sequence {
    strings:
        $signature = { 55 8B EC 51 83 EC 10 C7 }
    condition:
        $signature
}
