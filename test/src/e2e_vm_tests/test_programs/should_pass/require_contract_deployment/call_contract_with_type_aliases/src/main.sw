script;

use contract_with_type_aliases_abi::*;

#[cfg(experimental_new_encoding = false)]
const CONTRACT_ID = 0xbd74e82536dd497dc73b8810ed5750b2b3b5b97a08d31e89b4135cb5360d447d;
#[cfg(experimental_new_encoding = true)]
const CONTRACT_ID = 0xc577c27bda232264a316a51103d0d76ca4e285a2c049366b70dee5250b2177a1;

fn main() {
    let caller = abi(MyContract, CONTRACT_ID);

    let x: b256 = 0x0101010101010101010101010101010101010101010101010101010101010101;

    let y = [
        contract_with_type_aliases_abi::IdentityAlias::ContractId(ContractId::from(x)),
        contract_with_type_aliases_abi::IdentityAlias::Address(Address::from(0x0202020202020202020202020202020202020202020202020202020202020202)),
    ];

    let z = contract_with_type_aliases_abi::IdentityAliasWrapperAlias { i: y[0] };

    let w = Generic { f: z };

    let u = (x, x);

    let s = __to_str_array("fuelfuel0");

    let (x_result, y_result, z_result, w_result, u_result, s_result) = caller.foo(x, y, z, w, u, s);

    assert(x == x_result);
    assert(y == y_result);
    assert(z == z_result);
    assert(w.f == w_result.f);
    assert(u == u_result);
    assert(s == s_result);
}
