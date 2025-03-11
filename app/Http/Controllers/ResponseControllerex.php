/*
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Response;

class ResponseController extends Controller
{
    // Get all responses
    public function index(Request $request)
    {
        $responses = Response::all();
        
        if ($request->expectsJson()) {
            return response()->json($responses, 200);
        }
        
        return view('responses.index', compact('responses'));
    }

    // Store a new response
    public function store(Request $request)
    {
        $request->validate([
            'user_id' => 'required|integer',
            'sering_memikirkan' => 'required',
            'merasa_bahagia' => 'nullable|integer',
            'cemburu' => 'required',
            'nyaman_berbicara' => 'nullable|integer',
            'sering_chat' => 'required',
            'mencari_kesempatan' => 'required',
            'perhatian' => 'nullable|integer',
            'frekuensi_nyebut' => 'required',
            'jantung_berdebar' => 'required',
            'sering_menatap' => 'required',
            'gugup' => 'required',
            'senyum_saat_dengar_nama' => 'required',
            'membayangkan_masa_depan' => 'required',
            'prioritas' => 'nullable|integer',
            'mudah_memaafkan' => 'required',
            'kehilangan_motivasi' => 'nullable|integer',
            'label' => 'required',
        ]);

        $response = Response::create($request->all());
        
        if ($request->expectsJson()) {
            return response()->json($response, 201);
        }

        return redirect()->route('responses.index')->with('success', 'Response created successfully');
    }

    // Get single response
    public function show(Request $request, $id)
    {
        $response = Response::find($id);
        if (!$response) {
            return response()->json(['message' => 'Data not found'], 404);
        }

        if ($request->expectsJson()) {
            return response()->json($response, 200);
        }

        return view('responses.show', compact('response'));
    }

    // Update response
    public function update(Request $request, $id)
    {
        $response = Response::find($id);
        if (!$response) {
            return response()->json(['message' => 'Data not found'], 404);
        }

        $response->update($request->all());
        
        if ($request->expectsJson()) {
            return response()->json($response, 200);
        }

        return redirect()->route('responses.index')->with('success', 'Response updated successfully');
    }

    // Delete response
    public function destroy(Request $request, $id)
    {
        $response = Response::find($id);
        if (!$response) {
            return response()->json(['message' => 'Data not found'], 404);
        }
        
        $response->delete();
        
        if ($request->expectsJson()) {
            return response()->json(['message' => 'Data deleted successfully'], 200);
        }

        return redirect()->route('responses.index')->with('success', 'Response deleted successfully');
    }
}
/*

