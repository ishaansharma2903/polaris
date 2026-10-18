# polaris

**P**atched-conic **O**rbital **L**ambert **A**nd **R**apid **I**nterplanetary **S**olver

A fast, first-principles Python astrodynamics library for **preliminary interplanetary trajectory design**, multi-gravity-assist (MGA) mission planning, and $\Delta v$ budgeting.

---

## Planned Features

- **Core Orbital State Representations**:
  - `State`: Cartesian position/velocity vectors with input validation and immutability.
  - Robust conversion between Cartesian states and classical orbital elements ($a, e, i, \Omega, \omega, \nu$) using $\text{atan2}$ geometry and singularity guards.
  - ECI $\leftrightarrow$ Perifocal (PQW) reference frame transformations.
- **Universal-Variable Lambert Solver**:
  - Solves the two-point orbital boundary value problem for elliptic, parabolic, and hyperbolic transfers (Vallado Algorithm 58 / Curtis Section 5.3).
  - Hybrid Newton-Raphson iteration with bisection safeguard and negative-$y$ correction.
- **Ephemeris Retrieval**:
  - High-precision planetary state vectors via JPL Horizons API (`astroquery.jplhorizons`) with ISO date/JD parsing and LRU caching.
- **Patched-Conic Interplanetary Transfers**:
  - Single-leg interplanetary transfers calculating $C_3$, hyperbolic excess velocities ($\mathbf{v}_\infty$), and parking orbit departure/capture $\Delta v$ budgets.
  - 2D Porkchop plot grid analysis for launch window optimization.
- **Gravity Assists & Maneuvers**:
  - Hyperbolic gravity-assist kinematics: turn angle $\delta$, periapsis radius $r_p$ and altitude $h_p$, maximum safe deflection, and powered flyby $\Delta v_{\text{peri}}$.
  - Deep-space maneuver (DSM) two-subleg trajectory arc solver.
- **Multi-Leg Trajectory Assembly & Optimization**:
  - `solve_mga_trajectory()`: Assemble complex multi-gravity-assist sequences (e.g. Earth–Earth–Venus–Venus–Mercury–Mercury–Mercury–Mercury) with intermediate flybys and DSMs.
  - `optimize_mga_epochs()`: Numerical encounter epoch optimizer with cubic spline ephemeris pre-fetching.
- **NASA GMAT Export Bridge**:
  - Generates ready-to-run GMAT (.script) files to seed high-fidelity N-body numerical integration.

---

## Installation

```bash
git clone https://github.com/ishaansharma2903/polaris.git
cd polaris
python -m venv .venv
source .venv/bin/activate  # Windows: .venv\Scripts\activate
pip install -e ".[dev]"
```
---

## License

MIT License.
