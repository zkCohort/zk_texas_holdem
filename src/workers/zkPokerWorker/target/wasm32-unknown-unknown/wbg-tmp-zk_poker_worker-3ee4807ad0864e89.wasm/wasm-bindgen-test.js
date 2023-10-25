let imports = {};
imports['__wbindgen_placeholder__'] = module.exports;
let wasm;
const { TextDecoder, TextEncoder } = require(`util`);

let cachedTextDecoder = new TextDecoder('utf-8', { ignoreBOM: true, fatal: true });

cachedTextDecoder.decode();

let cachedUint8Memory0 = null;

function getUint8Memory0() {
    if (cachedUint8Memory0 === null || cachedUint8Memory0.byteLength === 0) {
        cachedUint8Memory0 = new Uint8Array(wasm.memory.buffer);
    }
    return cachedUint8Memory0;
}

function getStringFromWasm0(ptr, len) {
    ptr = ptr >>> 0;
    return cachedTextDecoder.decode(getUint8Memory0().subarray(ptr, ptr + len));
}

const heap = new Array(128).fill(undefined);

heap.push(undefined, null, true, false);

let heap_next = heap.length;

function addHeapObject(obj) {
    if (heap_next === heap.length) heap.push(heap.length + 1);
    const idx = heap_next;
    heap_next = heap[idx];

    if (typeof(heap_next) !== 'number') throw new Error('corrupt heap');

    heap[idx] = obj;
    return idx;
}

function getObject(idx) { return heap[idx]; }

let WASM_VECTOR_LEN = 0;

let cachedTextEncoder = new TextEncoder('utf-8');

const encodeString = (typeof cachedTextEncoder.encodeInto === 'function'
    ? function (arg, view) {
    return cachedTextEncoder.encodeInto(arg, view);
}
    : function (arg, view) {
    const buf = cachedTextEncoder.encode(arg);
    view.set(buf);
    return {
        read: arg.length,
        written: buf.length
    };
});

function passStringToWasm0(arg, malloc, realloc) {

    if (typeof(arg) !== 'string') throw new Error('expected a string argument');

    if (realloc === undefined) {
        const buf = cachedTextEncoder.encode(arg);
        const ptr = malloc(buf.length, 1) >>> 0;
        getUint8Memory0().subarray(ptr, ptr + buf.length).set(buf);
        WASM_VECTOR_LEN = buf.length;
        return ptr;
    }

    let len = arg.length;
    let ptr = malloc(len, 1) >>> 0;

    const mem = getUint8Memory0();

    let offset = 0;

    for (; offset < len; offset++) {
        const code = arg.charCodeAt(offset);
        if (code > 0x7F) break;
        mem[ptr + offset] = code;
    }

    if (offset !== len) {
        if (offset !== 0) {
            arg = arg.slice(offset);
        }
        ptr = realloc(ptr, len, len = offset + arg.length * 3, 1) >>> 0;
        const view = getUint8Memory0().subarray(ptr + offset, ptr + len);
        const ret = encodeString(arg, view);
        if (ret.read !== arg.length) throw new Error('failed to pass whole string');
        offset += ret.written;
    }

    WASM_VECTOR_LEN = offset;
    return ptr;
}

function isLikeNone(x) {
    return x === undefined || x === null;
}

let cachedInt32Memory0 = null;

function getInt32Memory0() {
    if (cachedInt32Memory0 === null || cachedInt32Memory0.byteLength === 0) {
        cachedInt32Memory0 = new Int32Array(wasm.memory.buffer);
    }
    return cachedInt32Memory0;
}

function dropObject(idx) {
    if (idx < 132) return;
    heap[idx] = heap_next;
    heap_next = idx;
}

function takeObject(idx) {
    const ret = getObject(idx);
    dropObject(idx);
    return ret;
}

function _assertBoolean(n) {
    if (typeof(n) !== 'boolean') {
        throw new Error('expected a boolean argument');
    }
}

function debugString(val) {
    // primitive types
    const type = typeof val;
    if (type == 'number' || type == 'boolean' || val == null) {
        return  `${val}`;
    }
    if (type == 'string') {
        return `"${val}"`;
    }
    if (type == 'symbol') {
        const description = val.description;
        if (description == null) {
            return 'Symbol';
        } else {
            return `Symbol(${description})`;
        }
    }
    if (type == 'function') {
        const name = val.name;
        if (typeof name == 'string' && name.length > 0) {
            return `Function(${name})`;
        } else {
            return 'Function';
        }
    }
    // objects
    if (Array.isArray(val)) {
        const length = val.length;
        let debug = '[';
        if (length > 0) {
            debug += debugString(val[0]);
        }
        for(let i = 1; i < length; i++) {
            debug += ', ' + debugString(val[i]);
        }
        debug += ']';
        return debug;
    }
    // Test for built-in
    const builtInMatches = /\[object ([^\]]+)\]/.exec(toString.call(val));
    let className;
    if (builtInMatches.length > 1) {
        className = builtInMatches[1];
    } else {
        // Failed to match the standard '[object ClassName]'
        return toString.call(val);
    }
    if (className == 'Object') {
        // we're a user defined class or Object
        // JSON.stringify avoids problems with cycles, and is generally much
        // easier than looping through ownProperties of `val`.
        try {
            return 'Object(' + JSON.stringify(val) + ')';
        } catch (_) {
            return 'Object';
        }
    }
    // errors
    if (val instanceof Error) {
        return `${val.name}: ${val.message}\n${val.stack}`;
    }
    // TODO we could test for more things here, like `Set`s and `Map`s.
    return className;
}

function makeMutClosure(arg0, arg1, dtor, f) {
    const state = { a: arg0, b: arg1, cnt: 1, dtor };
    const real = (...args) => {
        // First up with a closure we increment the internal reference
        // count. This ensures that the Rust closure environment won't
        // be deallocated while we're invoking it.
        state.cnt++;
        const a = state.a;
        state.a = 0;
        try {
            return f(a, state.b, ...args);
        } finally {
            if (--state.cnt === 0) {
                wasm.__wbindgen_export_2.get(state.dtor)(a, state.b);

            } else {
                state.a = a;
            }
        }
    };
    real.original = state;

    return real;
}

function logError(f, args) {
    try {
        return f.apply(this, args);
    } catch (e) {
        let error = (function () {
            try {
                return e instanceof Error ? `${e.message}\n\nStack:\n${e.stack}` : e.toString();
            } catch(_) {
                return "<failed to stringify thrown value>";
            }
        }());
        console.error("wasm-bindgen: imported JS function that was not marked as `catch` threw an error:", error);
        throw e;
    }
}

function _assertNum(n) {
    if (typeof(n) !== 'number') throw new Error('expected a number argument');
}
function __wbg_adapter_28(arg0, arg1, arg2) {
    _assertNum(arg0);
    _assertNum(arg1);
    wasm._dyn_core__ops__function__FnMut__A____Output___R_as_wasm_bindgen__closure__WasmClosure___describe__invoke__h1166055a15d4eb71(arg0, arg1, addHeapObject(arg2));
}

/**
* @param {string} x
* @param {string} y
* @returns {string}
*/
module.exports.cantors_pairing = function(x, y) {
    let deferred3_0;
    let deferred3_1;
    try {
        const retptr = wasm.__wbindgen_add_to_stack_pointer(-16);
        const ptr0 = passStringToWasm0(x, wasm.__wbindgen_malloc, wasm.__wbindgen_realloc);
        const len0 = WASM_VECTOR_LEN;
        const ptr1 = passStringToWasm0(y, wasm.__wbindgen_malloc, wasm.__wbindgen_realloc);
        const len1 = WASM_VECTOR_LEN;
        wasm.cantors_pairing(retptr, ptr0, len0, ptr1, len1);
        var r0 = getInt32Memory0()[retptr / 4 + 0];
        var r1 = getInt32Memory0()[retptr / 4 + 1];
        deferred3_0 = r0;
        deferred3_1 = r1;
        return getStringFromWasm0(r0, r1);
    } finally {
        wasm.__wbindgen_add_to_stack_pointer(16);
        wasm.__wbindgen_free(deferred3_0, deferred3_1, 1);
    }
};

/**
* @returns {any}
*/
module.exports.generate_phi_n_js = function() {
    const ret = wasm.generate_phi_n_js();
    return takeObject(ret);
};

/**
* @param {string} p_js
* @param {string} q_js
* @returns {any}
*/
module.exports.generate_key_pair_js = function(p_js, q_js) {
    const ptr0 = passStringToWasm0(p_js, wasm.__wbindgen_malloc, wasm.__wbindgen_realloc);
    const len0 = WASM_VECTOR_LEN;
    const ptr1 = passStringToWasm0(q_js, wasm.__wbindgen_malloc, wasm.__wbindgen_realloc);
    const len1 = WASM_VECTOR_LEN;
    const ret = wasm.generate_key_pair_js(ptr0, len0, ptr1, len1);
    return takeObject(ret);
};

/**
* @param {string} message_js
* @param {string} e_js
* @param {string} n_js
* @returns {any}
*/
module.exports.encrypt_js = function(message_js, e_js, n_js) {
    const ptr0 = passStringToWasm0(message_js, wasm.__wbindgen_malloc, wasm.__wbindgen_realloc);
    const len0 = WASM_VECTOR_LEN;
    const ptr1 = passStringToWasm0(e_js, wasm.__wbindgen_malloc, wasm.__wbindgen_realloc);
    const len1 = WASM_VECTOR_LEN;
    const ptr2 = passStringToWasm0(n_js, wasm.__wbindgen_malloc, wasm.__wbindgen_realloc);
    const len2 = WASM_VECTOR_LEN;
    const ret = wasm.encrypt_js(ptr0, len0, ptr1, len1, ptr2, len2);
    return takeObject(ret);
};

/**
* @param {string} cipher_js
* @param {string} d_js
* @param {string} n_js
* @returns {any}
*/
module.exports.decrypt_js = function(cipher_js, d_js, n_js) {
    const ptr0 = passStringToWasm0(cipher_js, wasm.__wbindgen_malloc, wasm.__wbindgen_realloc);
    const len0 = WASM_VECTOR_LEN;
    const ptr1 = passStringToWasm0(d_js, wasm.__wbindgen_malloc, wasm.__wbindgen_realloc);
    const len1 = WASM_VECTOR_LEN;
    const ptr2 = passStringToWasm0(n_js, wasm.__wbindgen_malloc, wasm.__wbindgen_realloc);
    const len2 = WASM_VECTOR_LEN;
    const ret = wasm.decrypt_js(ptr0, len0, ptr1, len1, ptr2, len2);
    return takeObject(ret);
};

let cachedUint32Memory0 = null;

function getUint32Memory0() {
    if (cachedUint32Memory0 === null || cachedUint32Memory0.byteLength === 0) {
        cachedUint32Memory0 = new Uint32Array(wasm.memory.buffer);
    }
    return cachedUint32Memory0;
}

function passArrayJsValueToWasm0(array, malloc) {
    const ptr = malloc(array.length * 4, 4) >>> 0;
    const mem = getUint32Memory0();
    for (let i = 0; i < array.length; i++) {
        mem[ptr / 4 + i] = addHeapObject(array[i]);
    }
    WASM_VECTOR_LEN = array.length;
    return ptr;
}

let stack_pointer = 128;

function addBorrowedObject(obj) {
    if (stack_pointer == 1) throw new Error('out of js stack');
    heap[--stack_pointer] = obj;
    return stack_pointer;
}
/**
* Handler for `console.log` invocations.
*
* If a test is currently running it takes the `args` array and stringifies
* it and appends it to the current output of the test. Otherwise it passes
* the arguments to the original `console.log` function, psased as
* `original`.
* @param {Array<any>} args
*/
module.exports.__wbgtest_console_log = function(args) {
    try {
        wasm.__wbgtest_console_log(addBorrowedObject(args));
    } finally {
        heap[stack_pointer++] = undefined;
    }
};

/**
* Handler for `console.debug` invocations. See above.
* @param {Array<any>} args
*/
module.exports.__wbgtest_console_debug = function(args) {
    try {
        wasm.__wbgtest_console_debug(addBorrowedObject(args));
    } finally {
        heap[stack_pointer++] = undefined;
    }
};

/**
* Handler for `console.info` invocations. See above.
* @param {Array<any>} args
*/
module.exports.__wbgtest_console_info = function(args) {
    try {
        wasm.__wbgtest_console_info(addBorrowedObject(args));
    } finally {
        heap[stack_pointer++] = undefined;
    }
};

/**
* Handler for `console.warn` invocations. See above.
* @param {Array<any>} args
*/
module.exports.__wbgtest_console_warn = function(args) {
    try {
        wasm.__wbgtest_console_warn(addBorrowedObject(args));
    } finally {
        heap[stack_pointer++] = undefined;
    }
};

/**
* Handler for `console.error` invocations. See above.
* @param {Array<any>} args
*/
module.exports.__wbgtest_console_error = function(args) {
    try {
        wasm.__wbgtest_console_error(addBorrowedObject(args));
    } finally {
        heap[stack_pointer++] = undefined;
    }
};

function __wbg_adapter_52(arg0, arg1) {
    _assertNum(arg0);
    _assertNum(arg1);
    wasm.wasm_bindgen__convert__closures__invoke0_mut__h2187b4253dd700bc(arg0, arg1);
}

function handleError(f, args) {
    try {
        return f.apply(this, args);
    } catch (e) {
        wasm.__wbindgen_exn_store(addHeapObject(e));
    }
}
function __wbg_adapter_95(arg0, arg1, arg2, arg3, arg4) {
    _assertNum(arg0);
    _assertNum(arg1);
    _assertNum(arg3);
    wasm.wasm_bindgen__convert__closures__invoke3_mut__h302430d772fac457(arg0, arg1, addHeapObject(arg2), arg3, addHeapObject(arg4));
}

function __wbg_adapter_110(arg0, arg1, arg2, arg3) {
    _assertNum(arg0);
    _assertNum(arg1);
    wasm.wasm_bindgen__convert__closures__invoke2_mut__hf9e88fc5e3be1bfa(arg0, arg1, addHeapObject(arg2), addHeapObject(arg3));
}

/**
* Runtime test harness support instantiated in JS.
*
* The node.js entry script instantiates a `Context` here which is used to
* drive test execution.
*/
class WasmBindgenTestContext {

    static __wrap(ptr) {
        ptr = ptr >>> 0;
        const obj = Object.create(WasmBindgenTestContext.prototype);
        obj.__wbg_ptr = ptr;

        return obj;
    }

    __destroy_into_raw() {
        const ptr = this.__wbg_ptr;
        this.__wbg_ptr = 0;

        return ptr;
    }

    free() {
        const ptr = this.__destroy_into_raw();
        wasm.__wbg_wasmbindgentestcontext_free(ptr);
    }
    /**
    * Creates a new context ready to run tests.
    *
    * A `Context` is the main structure through which test execution is
    * coordinated, and this will collect output and results for all executed
    * tests.
    */
    constructor() {
        const ret = wasm.wasmbindgentestcontext_new();
        return WasmBindgenTestContext.__wrap(ret);
    }
    /**
    * Inform this context about runtime arguments passed to the test
    * harness.
    *
    * Eventually this will be used to support flags, but for now it's just
    * used to support test filters.
    * @param {any[]} args
    */
    args(args) {
        if (this.__wbg_ptr == 0) throw new Error('Attempt to use a moved value');
        _assertNum(this.__wbg_ptr);
        const ptr0 = passArrayJsValueToWasm0(args, wasm.__wbindgen_malloc);
        const len0 = WASM_VECTOR_LEN;
        wasm.wasmbindgentestcontext_args(this.__wbg_ptr, ptr0, len0);
    }
    /**
    * Executes a list of tests, returning a promise representing their
    * eventual completion.
    *
    * This is the main entry point for executing tests. All the tests passed
    * in are the JS `Function` object that was plucked off the
    * `WebAssembly.Instance` exports list.
    *
    * The promise returned resolves to either `true` if all tests passed or
    * `false` if at least one test failed.
    * @param {any[]} tests
    * @returns {Promise<any>}
    */
    run(tests) {
        if (this.__wbg_ptr == 0) throw new Error('Attempt to use a moved value');
        _assertNum(this.__wbg_ptr);
        const ptr0 = passArrayJsValueToWasm0(tests, wasm.__wbindgen_malloc);
        const len0 = WASM_VECTOR_LEN;
        const ret = wasm.wasmbindgentestcontext_run(this.__wbg_ptr, ptr0, len0);
        return takeObject(ret);
    }
}
module.exports.WasmBindgenTestContext = WasmBindgenTestContext;

module.exports.__wbindgen_string_new = function(arg0, arg1) {
    const ret = getStringFromWasm0(arg0, arg1);
    return addHeapObject(ret);
};

module.exports.__wbg_log_ba94542530869933 = function() { return logError(function (arg0, arg1) {
    console.log(getStringFromWasm0(arg0, arg1));
}, arguments) };

module.exports.__wbindgen_number_new = function(arg0) {
    const ret = arg0;
    return addHeapObject(ret);
};

module.exports.__wbindgen_string_get = function(arg0, arg1) {
    const obj = getObject(arg1);
    const ret = typeof(obj) === 'string' ? obj : undefined;
    var ptr1 = isLikeNone(ret) ? 0 : passStringToWasm0(ret, wasm.__wbindgen_malloc, wasm.__wbindgen_realloc);
    var len1 = WASM_VECTOR_LEN;
    getInt32Memory0()[arg0 / 4 + 1] = len1;
    getInt32Memory0()[arg0 / 4 + 0] = ptr1;
};

module.exports.__wbindgen_object_clone_ref = function(arg0) {
    const ret = getObject(arg0);
    return addHeapObject(ret);
};

module.exports.__wbg_stack_7ffb21b96b519484 = function() { return logError(function (arg0) {
    const ret = getObject(arg0).stack;
    return addHeapObject(ret);
}, arguments) };

module.exports.__wbg_wbgtestoutputwriteln_6829eddea6f46c60 = function() { return logError(function (arg0) {
    __wbg_test_output_writeln(takeObject(arg0));
}, arguments) };

module.exports.__wbg_log_aac03509bb2d7b55 = function() { return logError(function (arg0, arg1) {
    console.log(getStringFromWasm0(arg0, arg1));
}, arguments) };

module.exports.__wbg_String_c9f8fcfc09f70054 = function() { return logError(function (arg0, arg1) {
    const ret = String(getObject(arg1));
    const ptr1 = passStringToWasm0(ret, wasm.__wbindgen_malloc, wasm.__wbindgen_realloc);
    const len1 = WASM_VECTOR_LEN;
    getInt32Memory0()[arg0 / 4 + 1] = len1;
    getInt32Memory0()[arg0 / 4 + 0] = ptr1;
}, arguments) };

module.exports.__wbg_wbgtestinvoke_7de5d5374a833823 = function() { return handleError(function (arg0, arg1) {
    try {
        var state0 = {a: arg0, b: arg1};
        var cb0 = () => {
            const a = state0.a;
            state0.a = 0;
            try {
                return __wbg_adapter_52(a, state0.b, );
            } finally {
                state0.a = a;
            }
        };
        __wbg_test_invoke(cb0);
    } finally {
        state0.a = state0.b = 0;
    }
}, arguments) };

module.exports.__wbg_static_accessor_document_a955a7208875489c = function() { return logError(function () {
    const ret = document;
    return addHeapObject(ret);
}, arguments) };

module.exports.__wbg_getElementById_a19340abadee780a = function() { return logError(function (arg0, arg1, arg2) {
    const ret = getObject(arg0).getElementById(getStringFromWasm0(arg1, arg2));
    return addHeapObject(ret);
}, arguments) };

module.exports.__wbg_textcontent_2418b136fbd0e378 = function() { return logError(function (arg0, arg1) {
    const ret = getObject(arg1).textContent;
    const ptr1 = passStringToWasm0(ret, wasm.__wbindgen_malloc, wasm.__wbindgen_realloc);
    const len1 = WASM_VECTOR_LEN;
    getInt32Memory0()[arg0 / 4 + 1] = len1;
    getInt32Memory0()[arg0 / 4 + 0] = ptr1;
}, arguments) };

module.exports.__wbg_settextcontent_040820499bb5fe46 = function() { return logError(function (arg0, arg1, arg2) {
    getObject(arg0).textContent = getStringFromWasm0(arg1, arg2);
}, arguments) };

module.exports.__wbg_stack_486eebc2bccbc1f4 = function() { return logError(function (arg0) {
    const ret = getObject(arg0).stack;
    return addHeapObject(ret);
}, arguments) };

module.exports.__wbg_self_f12382a96c29176d = function() { return logError(function (arg0) {
    const ret = getObject(arg0).self;
    return isLikeNone(ret) ? 0 : addHeapObject(ret);
}, arguments) };

module.exports.__wbg_constructor_85bd1a4c998482d2 = function() { return logError(function (arg0) {
    const ret = getObject(arg0).constructor;
    return addHeapObject(ret);
}, arguments) };

module.exports.__wbg_name_737814bf19c6ced1 = function() { return logError(function (arg0, arg1) {
    const ret = getObject(arg1).name;
    const ptr1 = passStringToWasm0(ret, wasm.__wbindgen_malloc, wasm.__wbindgen_realloc);
    const len1 = WASM_VECTOR_LEN;
    getInt32Memory0()[arg0 / 4 + 1] = len1;
    getInt32Memory0()[arg0 / 4 + 0] = ptr1;
}, arguments) };

module.exports.__wbg_stack_67a3c970c48fd391 = function() { return logError(function (arg0, arg1) {
    const ret = getObject(arg1).stack;
    const ptr1 = passStringToWasm0(ret, wasm.__wbindgen_malloc, wasm.__wbindgen_realloc);
    const len1 = WASM_VECTOR_LEN;
    getInt32Memory0()[arg0 / 4 + 1] = len1;
    getInt32Memory0()[arg0 / 4 + 0] = ptr1;
}, arguments) };

module.exports.__wbindgen_object_drop_ref = function(arg0) {
    takeObject(arg0);
};

module.exports.__wbg_error_f851667af71bcfc6 = function() { return logError(function (arg0, arg1) {
    let deferred0_0;
    let deferred0_1;
    try {
        deferred0_0 = arg0;
        deferred0_1 = arg1;
        console.error(getStringFromWasm0(arg0, arg1));
    } finally {
        wasm.__wbindgen_free(deferred0_0, deferred0_1, 1);
    }
}, arguments) };

module.exports.__wbg_new_abda76e883ba8a5f = function() { return logError(function () {
    const ret = new Error();
    return addHeapObject(ret);
}, arguments) };

module.exports.__wbg_stack_658279fe44541cf6 = function() { return logError(function (arg0, arg1) {
    const ret = getObject(arg1).stack;
    const ptr1 = passStringToWasm0(ret, wasm.__wbindgen_malloc, wasm.__wbindgen_realloc);
    const len1 = WASM_VECTOR_LEN;
    getInt32Memory0()[arg0 / 4 + 1] = len1;
    getInt32Memory0()[arg0 / 4 + 0] = ptr1;
}, arguments) };

module.exports.__wbindgen_cb_drop = function(arg0) {
    const obj = takeObject(arg0).original;
    if (obj.cnt-- == 1) {
        obj.a = 0;
        return true;
    }
    const ret = false;
    _assertBoolean(ret);
    return ret;
};

module.exports.__wbindgen_is_object = function(arg0) {
    const val = getObject(arg0);
    const ret = typeof(val) === 'object' && val !== null;
    _assertBoolean(ret);
    return ret;
};

module.exports.__wbindgen_is_string = function(arg0) {
    const ret = typeof(getObject(arg0)) === 'string';
    _assertBoolean(ret);
    return ret;
};

module.exports.__wbg_crypto_c48a774b022d20ac = function() { return logError(function (arg0) {
    const ret = getObject(arg0).crypto;
    return addHeapObject(ret);
}, arguments) };

module.exports.__wbg_msCrypto_bcb970640f50a1e8 = function() { return logError(function (arg0) {
    const ret = getObject(arg0).msCrypto;
    return addHeapObject(ret);
}, arguments) };

module.exports.__wbg_getRandomValues_37fa2ca9e4e07fab = function() { return handleError(function (arg0, arg1) {
    getObject(arg0).getRandomValues(getObject(arg1));
}, arguments) };

module.exports.__wbg_randomFillSync_dc1e9a60c158336d = function() { return handleError(function (arg0, arg1) {
    getObject(arg0).randomFillSync(takeObject(arg1));
}, arguments) };

module.exports.__wbg_require_8f08ceecec0f4fee = function() { return handleError(function () {
    const ret = module.require;
    return addHeapObject(ret);
}, arguments) };

module.exports.__wbg_process_298734cf255a885d = function() { return logError(function (arg0) {
    const ret = getObject(arg0).process;
    return addHeapObject(ret);
}, arguments) };

module.exports.__wbg_versions_e2e78e134e3e5d01 = function() { return logError(function (arg0) {
    const ret = getObject(arg0).versions;
    return addHeapObject(ret);
}, arguments) };

module.exports.__wbg_node_1cd7a5d853dbea79 = function() { return logError(function (arg0) {
    const ret = getObject(arg0).node;
    return addHeapObject(ret);
}, arguments) };

module.exports.__wbg_forEach_c4a9c2a1e9a630ba = function() { return logError(function (arg0, arg1, arg2) {
    try {
        var state0 = {a: arg1, b: arg2};
        var cb0 = (arg0, arg1, arg2) => {
            const a = state0.a;
            state0.a = 0;
            try {
                return __wbg_adapter_95(a, state0.b, arg0, arg1, arg2);
            } finally {
                state0.a = a;
            }
        };
        getObject(arg0).forEach(cb0);
    } finally {
        state0.a = state0.b = 0;
    }
}, arguments) };

module.exports.__wbg_message_48bacc5ea57d74ee = function() { return logError(function (arg0) {
    const ret = getObject(arg0).message;
    return addHeapObject(ret);
}, arguments) };

module.exports.__wbg_name_8f734cbbd6194153 = function() { return logError(function (arg0) {
    const ret = getObject(arg0).name;
    return addHeapObject(ret);
}, arguments) };

module.exports.__wbg_newnoargs_581967eacc0e2604 = function() { return logError(function (arg0, arg1) {
    const ret = new Function(getStringFromWasm0(arg0, arg1));
    return addHeapObject(ret);
}, arguments) };

module.exports.__wbg_call_cb65541d95d71282 = function() { return handleError(function (arg0, arg1) {
    const ret = getObject(arg0).call(getObject(arg1));
    return addHeapObject(ret);
}, arguments) };

module.exports.__wbg_call_01734de55d61e11d = function() { return handleError(function (arg0, arg1, arg2) {
    const ret = getObject(arg0).call(getObject(arg1), getObject(arg2));
    return addHeapObject(ret);
}, arguments) };

module.exports.__wbg_new_b51585de1b234aff = function() { return logError(function () {
    const ret = new Object();
    return addHeapObject(ret);
}, arguments) };

module.exports.__wbg_new_43f1b47c28813cbd = function() { return logError(function (arg0, arg1) {
    try {
        var state0 = {a: arg0, b: arg1};
        var cb0 = (arg0, arg1) => {
            const a = state0.a;
            state0.a = 0;
            try {
                return __wbg_adapter_110(a, state0.b, arg0, arg1);
            } finally {
                state0.a = a;
            }
        };
        const ret = new Promise(cb0);
        return addHeapObject(ret);
    } finally {
        state0.a = state0.b = 0;
    }
}, arguments) };

module.exports.__wbg_resolve_53698b95aaf7fcf8 = function() { return logError(function (arg0) {
    const ret = Promise.resolve(getObject(arg0));
    return addHeapObject(ret);
}, arguments) };

module.exports.__wbg_then_f7e06ee3c11698eb = function() { return logError(function (arg0, arg1) {
    const ret = getObject(arg0).then(getObject(arg1));
    return addHeapObject(ret);
}, arguments) };

module.exports.__wbg_globalThis_1d39714405582d3c = function() { return handleError(function () {
    const ret = globalThis.globalThis;
    return addHeapObject(ret);
}, arguments) };

module.exports.__wbg_self_1ff1d729e9aae938 = function() { return handleError(function () {
    const ret = self.self;
    return addHeapObject(ret);
}, arguments) };

module.exports.__wbg_window_5f4faef6c12b79ec = function() { return handleError(function () {
    const ret = window.window;
    return addHeapObject(ret);
}, arguments) };

module.exports.__wbg_global_651f05c6a0944d1c = function() { return handleError(function () {
    const ret = global.global;
    return addHeapObject(ret);
}, arguments) };

module.exports.__wbg_new_8125e318e6245eed = function() { return logError(function (arg0) {
    const ret = new Uint8Array(getObject(arg0));
    return addHeapObject(ret);
}, arguments) };

module.exports.__wbg_newwithlength_e5d69174d6984cd7 = function() { return logError(function (arg0) {
    const ret = new Uint8Array(arg0 >>> 0);
    return addHeapObject(ret);
}, arguments) };

module.exports.__wbg_newwithbyteoffsetandlength_6da8e527659b86aa = function() { return logError(function (arg0, arg1, arg2) {
    const ret = new Uint8Array(getObject(arg0), arg1 >>> 0, arg2 >>> 0);
    return addHeapObject(ret);
}, arguments) };

module.exports.__wbg_subarray_13db269f57aa838d = function() { return logError(function (arg0, arg1, arg2) {
    const ret = getObject(arg0).subarray(arg1 >>> 0, arg2 >>> 0);
    return addHeapObject(ret);
}, arguments) };

module.exports.__wbg_set_5cf90238115182c3 = function() { return logError(function (arg0, arg1, arg2) {
    getObject(arg0).set(getObject(arg1), arg2 >>> 0);
}, arguments) };

module.exports.__wbg_set_092e06b0f9d71865 = function() { return handleError(function (arg0, arg1, arg2) {
    const ret = Reflect.set(getObject(arg0), getObject(arg1), getObject(arg2));
    _assertBoolean(ret);
    return ret;
}, arguments) };

module.exports.__wbg_buffer_085ec1f694018c4f = function() { return logError(function (arg0) {
    const ret = getObject(arg0).buffer;
    return addHeapObject(ret);
}, arguments) };

module.exports.__wbindgen_is_function = function(arg0) {
    const ret = typeof(getObject(arg0)) === 'function';
    _assertBoolean(ret);
    return ret;
};

module.exports.__wbindgen_is_undefined = function(arg0) {
    const ret = getObject(arg0) === undefined;
    _assertBoolean(ret);
    return ret;
};

module.exports.__wbindgen_debug_string = function(arg0, arg1) {
    const ret = debugString(getObject(arg1));
    const ptr1 = passStringToWasm0(ret, wasm.__wbindgen_malloc, wasm.__wbindgen_realloc);
    const len1 = WASM_VECTOR_LEN;
    getInt32Memory0()[arg0 / 4 + 1] = len1;
    getInt32Memory0()[arg0 / 4 + 0] = ptr1;
};

module.exports.__wbindgen_throw = function(arg0, arg1) {
    throw new Error(getStringFromWasm0(arg0, arg1));
};

module.exports.__wbindgen_memory = function() {
    const ret = wasm.memory;
    return addHeapObject(ret);
};

module.exports.__wbindgen_closure_wrapper1406 = function() { return logError(function (arg0, arg1, arg2) {
    const ret = makeMutClosure(arg0, arg1, 229, __wbg_adapter_28);
    return addHeapObject(ret);
}, arguments) };

const path = require('path').join(__dirname, 'wasm-bindgen-test_bg.wasm');
const bytes = require('fs').readFileSync(path);

const wasmModule = new WebAssembly.Module(bytes);
const wasmInstance = new WebAssembly.Instance(wasmModule, imports);
wasm = wasmInstance.exports;
module.exports.__wasm = wasm;

